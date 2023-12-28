import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';
import 'package:flutter_game_shop_ui/functions/customDrawer.dart';
import 'package:flutter_game_shop_ui/screens/Searchdescription.dart';
import 'package:flutter_game_shop_ui/screens/apidescription.dart';
import 'package:flutter_game_shop_ui/functions/appWidget.dart';
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
  //List<AppInfo> samplePosts = [];
  String name = '';
  late TextEditingController searchController;
  late Future<List<AppInfo>> futureData;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
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
  // void _onSearchSubmitted(String query) {
  //   // Find a matching app based on the entered query
  //   AppInfo? matchedApp = samplePosts.firstWhere(
  //     (app) => app.name.toLowerCase().contains(query.toLowerCase()),
  //     orElse: () => null,
  //   );

  //   if (matchedApp != null) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => AppDetailsScreen(appInfo: matchedApp),
  //       ),
  //     );
  //   } else {
  //     // Show a message or handle no match scenario
  //     print('No matching app found');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: redColor1,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: CustomDrawer(),
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
                            backGroundColor1,
                            backGroundColor2,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height * 0.012,
                                          horizontal: width * 0.03),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: getBorderRadiusWidget(
                                            context, 0.03),
                                      ),
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.grey,
                                        size: width * 0.07,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.8,
                                    height: height * 0.06,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius:
                                          getBorderRadiusWidget(context, 0.03),
                                    ),
                                    // child: Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Row(
                                    //       children: [
                                    //         Icon(
                                    //           Icons.search,
                                    //           color: Colors.grey,
                                    //           size: width * 0.08,
                                    //         ),
                                    //         SizedBox(width: width * 0.02),
                                    //         Text(
                                    //           samplePosts[0].name,
                                    //           style: textStyle12,
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     Icon(
                                    //       Icons.menu_outlined,
                                    //       color: Colors.grey,
                                    //       size: width * 0.07,
                                    //     ),
                                    //   ],
                                    // ),

                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: searchController,
                                            decoration: const InputDecoration(
                                              hintText: 'Search...',
                                              hintStyle: textStyle12,
                                              border: InputBorder.none,
                                            ),
                                            style: textStyle12,
                                            onChanged: (value) {
                                              // Update the 'name' variable as the user types
                                              setState(() {
                                                name = value;
                                              });
                                            },
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigate to APIDESC page with the search query
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchDesc(
                                                  appList: samplePosts,
                                                  name: name,
                                                  currentIndex: 4,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.search,
                                            color: Colors.grey,
                                            size: width * 0.07,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                                      color: redColor2,
                                      borderRadius:
                                          getBorderRadiusWidget(context, 1),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.directions_walk_rounded,
                                          color: redColor1,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Popular Games',
                                    style: textStyle2,
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
                                                    currentIndex: 4,
                                                  )),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'pic3',
                                        child: GameOverViewWidget(
                                          width: width,
                                          height: height,
                                          imageName: 'assets/pic3.jpg',
                                          name:
                                              'Spider man: Spider man Remaster',
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
                                                  )),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'pic2',
                                        child: GameOverViewWidget(
                                          width: width,
                                          height: height,
                                          imageName: 'assets/pic3.jpg',
                                          name:
                                              'Spider man: Spider man Remaster',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'New Apps',
                                    style: textStyle2,
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
                                    NewAppWidget(
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
                }),
          ),
        ),
      ),
    );
  }
}
