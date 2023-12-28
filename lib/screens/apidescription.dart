import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';
import 'package:flutter_game_shop_ui/screens/first_screen.dart';
import 'package:flutter_game_shop_ui/screens/image_screen.dart';
import 'package:flutter_game_shop_ui/tools/border.dart';
import 'package:flutter_game_shop_ui/tools/colors.dart';

import '../tools/styles.dart';

class APIDESC extends StatelessWidget {
  APIDESC({
    Key? key,
    required this.appList,
    required this.currentIndex,
  }) : super(key: key);

  final List<AppInfo> appList;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    AppInfo currentApp = appList[currentIndex];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurple.shade900, // Updated to deep purple
                    Colors.black,
                  ],
                ),
              ),
              height: height * 0.5,
              child: Stack(
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
                      vertical: height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const FirstScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(width * 0.03),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: getBorderRadiusWidget(context, 1),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(width * 0.03),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: getBorderRadiusWidget(context, 1),
                          ),
                          child: const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentApp.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        currentApp.category,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.015,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: getBorderRadiusWidget(context, 1),
                      color: Colors.deepPurple
                          .withOpacity(0.8), // Updated to deep purple
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.download,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            const Text(
                              '1M',
                              style: textStyle5,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            Text(
                              currentApp.rating,
                              style: textStyle7,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone_android_outlined,
                              color: Colors.black,
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
                  SizedBox(
                    width: width,
                    child: Text(
                      'About' + ' ' + currentApp.name,
                      style: textStyle3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.02,
                    ),
                    child: Text(
                      currentApp.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
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
                      Text(
                        'See all',
                        style: textStyle11,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: getBorderRadiusWidget(context, 0.05),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
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
                        borderRadius: getBorderRadiusWidget(context, 0.05),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
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
                        borderRadius: getBorderRadiusWidget(context, 0.05),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
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
                  SizedBox(height: height * 0.02),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .deepPurple.shade900, // Adjusted to deep purple color
                      shape: getShapeWidget(context, 1),
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.015,
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Download ' + ,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
