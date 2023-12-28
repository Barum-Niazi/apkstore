import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';
import 'package:flutter_game_shop_ui/screens/api.dart';
import 'package:flutter_game_shop_ui/screens/apidescription.dart';
import 'package:flutter_game_shop_ui/screens/gameWidget.dart';
import 'package:flutter_game_shop_ui/screens/second_screen.dart';
import 'package:flutter_game_shop_ui/tools/border.dart';
import 'package:flutter_game_shop_ui/tools/colors.dart';
import 'package:http/http.dart' as http;

import '../tools/styles.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<List<AppInfo>> futureData;
  @override
  void initState() {
    super.initState();

    futureData = getData();
  }

  Future<List<AppInfo>> getData() async {
    final response = await http.get(Uri.parse('http://192.168.0.106:3000'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      List<AppInfo> posts = [];
      for (Map<String, dynamic> index in data) {
        posts.add(AppInfo.fromJson(index));
      }
      print('apple');
      return posts;
    } else {
      print('banana');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black, // Updated background color to black
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: FutureBuilder<List<AppInfo>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<AppInfo> samplePosts = snapshot.data ?? [];
                  return Container(
                    width: width,
                    height: height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black, // Updated gradient color to black
                          Colors.purple, // Updated gradient color to purple
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Center(
                            child: Container(
                              width: width * 0.9,
                              height: height * 0.06,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              decoration: BoxDecoration(
                                color: Colors
                                    .white, // Updated search bar color to white
                                borderRadius:
                                    getBorderRadiusWidget(context, 0.03),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                        size: width * 0.08,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        samplePosts[0].name,
                                        style: textStyle12,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.menu_outlined,
                                    color: Colors.grey,
                                    size: width * 0.07,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Padding(
                            padding: EdgeInsets.all(width * 0.03),
                            child: const Text(
                              'Categories',
                              style: textStyle2,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.02),
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * 0.006,
                                    horizontal: width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .purple, // Updated color to purple
                                    borderRadius:
                                        getBorderRadiusWidget(context, 1),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.directions_walk_rounded,
                                        color: Colors
                                            .white, // Updated color to white
                                      ),
                                      SizedBox(width: width * 0.02),
                                      const Text(
                                        'Action',
                                        style: textStyle13,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.02),
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * 0.006,
                                    horizontal: width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius:
                                        getBorderRadiusWidget(context, 1),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.car_crash_rounded,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      const Text(
                                        'Racing',
                                        style: textStyle6,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.02),
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * 0.006,
                                    horizontal: width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius:
                                        getBorderRadiusWidget(context, 1),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.castle,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      const Text(
                                        'Strategy',
                                        style: textStyle6,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.02),
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * 0.006,
                                    horizontal: width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius:
                                        getBorderRadiusWidget(context, 1),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.child_care,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      const Text(
                                        'Kids',
                                        style: textStyle6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.02,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Trending',
                                  style: textStyle2,
                                ),
                                Text(
                                  'See all',
                                  style: textStyle11,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GameOverViewWidget(
                                    width: width,
                                    height: height,
                                    imageName: 'assets/pic2.jpg',
                                    name: 'Call of Duty: Going War Mobile',
                                    star: '4.7',
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => APIDESC(
                                                  appList: samplePosts,
                                                  currentIndex: 0,
                                                  name: 'i hate mariam',
                                                )),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'pic3',
                                      child: GameOverViewWidget(
                                        width: width,
                                        height: height,
                                        imageName: 'assets/pic3.jpg',
                                        name: 'Spider man: Spider man Remaster',
                                        star: '4.8',
                                      ),
                                    ),
                                  ),
                                  GameOverViewWidget(
                                    width: width,
                                    height: height,
                                    imageName: 'assets/pic6.jpg',
                                    name: 'Battle Filed: World War 2',
                                    star: '4.2',
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => APIDESC(
                                                  appList: samplePosts,
                                                  currentIndex: 0,
                                                  name: 'i love her too',
                                                )),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'pic2',
                                      child: GameOverViewWidget(
                                        width: width,
                                        height: height,
                                        imageName: 'assets/pic3.jpg',
                                        name: 'Spider man: Spider man Remaster',
                                        star: '4.8',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.02,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'New Apps',
                                  style: textStyle2,
                                ),
                                Text(
                                  'See all',
                                  style: textStyle11,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(samplePosts.length, (index) {
                              return Column(
                                children: [
                                  NewGamesWidget(
                                    width: width,
                                    height: height,
                                    name: samplePosts[index].name,
                                    imageName: samplePosts[index].image1Url,
                                    category: samplePosts[index].category,
                                    rating: samplePosts[index].rating,
                                  ),
                                  SizedBox(height: height * 0.02),
                                ],
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
