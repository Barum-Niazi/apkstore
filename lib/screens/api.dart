import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';
import 'package:flutter_game_shop_ui/screens/first_screen.dart';
import 'package:flutter_game_shop_ui/screens/image_screen.dart';
import 'package:flutter_game_shop_ui/tools/border.dart';
import 'package:flutter_game_shop_ui/tools/colors.dart';

import '../tools/styles.dart';

class APIDESC2 extends StatelessWidget {
  APIDESC2({
    Key? key,
    required this.appList,
    required this.currentIndex,
  }) : super(key: key);

  List<AppInfo> appList;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    AppInfo currentApp = appList[currentIndex];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: height * 0.1,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'main_image_${currentApp.id}',
                  child: Image.network(
                    currentApp.image1Url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: [
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
                      padding: EdgeInsets.all(width * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: getBorderRadiusWidget(context, 1),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white30,
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
            SizedBox(
              height: height * 0.55,
              child: Center(
                child: Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: width * 0.12,
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.08,
              child: Container(
                width: width * 1,
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentApp.name,
                          style: textStyle8,
                        ),
                        Text(
                          currentApp.category,
                          style: textStyle9,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.008,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: getBorderRadiusWidget(context, 1),
                        color: Colors.black38,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text(
                            currentApp.rating,
                            style: textStyle14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(width * 0.08),
                    topLeft: Radius.circular(width * 0.08),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: height * 0.004,
                        ),
                        width: width * 0.2,
                        height: height * 0.01,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: getBorderRadiusWidget(context, 1),
                        ),
                      ),
                      Container(
                        width: width * 0.85,
                        height: height * 0.065,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: getBorderRadiusWidget(context, 1),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.download,
                                  color: redColor1,
                                ),
                                Text(
                                  '1M',
                                  style: textStyle5,
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: redColor1,
                                ),
                                Text(
                                  'Rated',
                                  style: textStyle7,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone_android_outlined,
                                  color: redColor1,
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
                        child: const Text(
                          'About game',
                          style: textStyle3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: height * 0.02,
                        ),
                        child: Text(
                          currentApp.description,
                          style: textStyle11,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Game Pictures',
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
                                      hero: 'detail_${currentApp.id}_1',
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'detail_${currentApp.id}_1',
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
                                      hero: 'detail_${currentApp.id}_2',
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'detail_${currentApp.id}_2',
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
                                      hero: 'detail_${currentApp.id}_3',
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'detail_${currentApp.id}_3',
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
                          primary: redColor1,
                          shape: getShapeWidget(context, 1),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.2,
                            vertical: height * 0.015,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Install Game',
                          style: textStyle8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
