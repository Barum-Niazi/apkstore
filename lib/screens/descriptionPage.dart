import 'package:flutter/material.dart';
import 'package:flutter_apk_store/appinfo.dart';
import 'package:flutter_apk_store/screens/homePage.dart';
import 'package:flutter_apk_store/screens/imageScreen.dart';
import 'package:flutter_apk_store/tools/border.dart';
import 'package:flutter_apk_store/tools/colors.dart';
import 'package:flutter_apk_store/functions/downloadApp.dart';

import '../tools/styles.dart';

class descriptionScreen extends StatelessWidget {
  descriptionScreen({
    Key? key,
    required this.appList,
    required this.currentIndex,
    required this.name,
  }) : super(key: key);

  final List<AppInfo> appList;
  int currentIndex;
  final String name;

  int findIndex(List<AppInfo> appList, String name) {
    for (int i = 0; i < appList.length; i++) {
      if (appList[i].name.toLowerCase() == name.toLowerCase()) {
        return i;
      }
    }
    return 1;
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
                            downloadApp(currentApp.downloadLink);
                          },
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.015,
                              ),
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'Download ' + ' ' + currentApp.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
