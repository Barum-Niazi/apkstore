import 'package:flutter/material.dart';
import 'package:flutter_apk_store/appinfo.dart';
import 'package:flutter_apk_store/screens/homePage.dart';
import 'package:flutter_apk_store/screens/imageScreen.dart';
import 'package:flutter_apk_store/tools/border.dart';
import 'package:flutter_apk_store/tools/colors.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

import '../tools/styles.dart';

class descriptionScreen extends StatefulWidget {
  descriptionScreen({
    Key? key,
    required this.appList,
    required this.currentIndex,
    required this.name,
  }) : super(key: key);

  final List<AppInfo> appList;
  int currentIndex;
  final String name;

  State<StatefulWidget> createState() => _descriptionScreenState(
        appList: appList,
        currentIndex: currentIndex,
        name: name,
      );
}

class _descriptionScreenState extends State<descriptionScreen> {
  _descriptionScreenState({
    required this.appList,
    required this.currentIndex,
    required this.name,
  });

  int _total = 0, _received = 0;
  File? application;
  final List<AppInfo> appList;
  int currentIndex;
  final String name;
  String filePath = 'NULL';
  Future<bool> fileStatus = Future<bool>.value(false);
  String progressText = 'Download';

  InterstitialAd? _interstitialAd;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  /// Loads an interstitial ad.
  void loadAd() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            // Called when the ad showed the full screen content.
            onAdShowedFullScreenContent: (ad) {
              debugPrint('InterstitialAd showed full screen content.');
            },
            // Called when an impression occurs on the ad.
            onAdImpression: (ad) {
              debugPrint('InterstitialAd impression recorded.');
            },
            // Called when the ad failed to show full screen content.
            onAdFailedToShowFullScreenContent: (ad, err) {
              debugPrint(
                  'InterstitialAd failed to show full screen content: $err');
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            // Called when the ad dismissed full screen content.
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('InterstitialAd dismissed full screen content.');
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            // Called when a click is recorded for an ad.
            onAdClicked: (ad) {
              debugPrint('InterstitialAd clicked.');
            },
          );

          debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _interstitialAd = ad;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  @override
  void initState() {
    loadAd();
    fileStatus = fileExists(appList[0].name);
    super.initState();
  }

  int findIndex(List<AppInfo> appList, String name) {
    for (int i = 0; i < appList.length; i++) {
      if (appList[i].name.toLowerCase() == name.toLowerCase()) {
        return i;
      }
    }
    return 1;
  }

  Future<bool> fileExists(String fileName) async {
    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      filePath = '${directory.path}/Download/$fileName.apk';
      final file = File(filePath);
      return file.exists();
    }
    return false;
  }

  Future<void> downloadAndSaveFile(String fileUrl, String name) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        fileUrl,
        onReceiveProgress: (received, total) {
          setState(() {
            _total = total;
            _received = received;
            if (_received >= _total) {
              progressText = 'Open';
            }
          });
        },
        options: Options(responseType: ResponseType.bytes),
      );

      // Check if the request was successful (status code 200).
      if (response.statusCode == 200) {
        // Get the external storage directory.
        final directory = await getExternalStorageDirectory();

        if (directory != null) {
          // Create a file with a unique name in the external storage directory.
          final file = File('${directory.path}/Download/$name.apk');

          // Ensure that the "Download" directory exists.
          final downloadDirectory = Directory('${directory.path}/Download');
          downloadDirectory.createSync(recursive: true);

          // Write the downloaded data to the file.
          await file.writeAsBytes(response.data);

          // File has been successfully downloaded and stored in the external storage directory (Downloads folder).
          print('File downloaded and saved to: ${file.path}');
        } else {
          // Handle the case where the external storage directory is not available.
          print('External storage directory is not available.');
        }
      } else {
        // Handle error cases here (e.g., file not found, server error, etc.).
        print('Error downloading file: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the process.
      print('Error: $e');
    }
  }

  void downloadFile(String fileURL, String name) async {
    if (await fileExists(name)) {
      if (await Permission.requestInstallPackages.request().isGranted) {
        final result = await OpenFile.open(filePath);
        print('Open file result: ${result.message}');
      }
    } else {
      downloadAndSaveFile(fileURL, name);
    }
  }

  @override
  Widget build(BuildContext context) {
    currentIndex = findIndex(appList, name);

    AppInfo currentApp = appList[currentIndex];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            Stack(
              children: [
                Hero(
                  tag: 'pic',
                  child: Image.network(
                    currentApp.image1Url,
                    width: width,
                    height: height * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.005,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(width * 0.03),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: getBorderRadiusWidget(context, 1),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(top: height * 0.42),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.1),
                        topRight: Radius.circular(width * 0.1),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.01),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.015,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: getBorderRadiusWidget(context, 1),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.app_registration_rounded,
                                          color: themeRed1),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Text(
                                        currentApp.category,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        color: themeRed1,
                                      ),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Text(
                                        currentApp.rating,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone_android_sharp,
                                        color: themeRed1,
                                      ),
                                      SizedBox(
                                        width: width * 0.015,
                                      ),
                                      Text(
                                        currentApp.size,
                                        style: textStyle5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              currentApp.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.01,
                          ),
                          child: Text(
                            currentApp.description,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'App Pictures',
                              style: textStyle3,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  getBorderRadiusWidget(context, 0.05),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ImageScreen(
                                        image: currentApp.image2Url,
                                        hero: 'detail7',
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'detail7',
                                  child: Image.network(
                                    currentApp.image2Url,
                                    width: width * 0.25,
                                    height: height * 0.12,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  getBorderRadiusWidget(context, 0.05),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ImageScreen(
                                        image: currentApp.image3Url,
                                        hero: 'detail8',
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'detail8',
                                  child: Image.network(
                                    currentApp.image3Url,
                                    width: width * 0.25,
                                    height: height * 0.12,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  getBorderRadiusWidget(context, 0.05),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ImageScreen(
                                        image: currentApp.image4Url,
                                        hero: 'detail9',
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'detail9',
                                  child: Image.network(
                                    currentApp.image4Url,
                                    width: width * 0.25,
                                    height: height * 0.12,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 0.05),
                            ),
                            primary: themeRed1,
                          ),
                          onPressed: () {
                            _interstitialAd!.show();
                            downloadFile(
                                currentApp.downloadLink, currentApp.name);
                          },
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.015,
                              ),
                              width: double.infinity,
                              child: Center(
                                  child: FutureBuilder<bool>(
                                future: fileStatus,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    // Check if the future is complete and has data
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data!
                                            ? 'Open'
                                            : '$progressText',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    } else {
                                      // Handle the case where snapshot doesn't have data
                                      return Text(
                                        'Error',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }
                                  } else {
                                    // Display a loading indicator while the future is in progress
                                    return CircularProgressIndicator();
                                  }
                                },
                              )),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        FutureBuilder<bool>(
                          future: fileStatus,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              // Check if the future is complete and the file is already downloaded
                              if (snapshot.data == true) {
                                return Text(
                                  'File already downloaded',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                // Show the download progress
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      child: LinearProgressIndicator(
                                        value: _total != 0
                                            ? (_received / _total)
                                                .clamp(0.0, 1.0)
                                            : 0.0,
                                        backgroundColor: Colors.grey.shade200,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                themeRed1),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      _total != 0
                                          ? '${((_received / _total) * 100).toStringAsFixed(2)}%'
                                          : '0%',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            } else {
                              // Display a loading indicator while waiting for the future
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
