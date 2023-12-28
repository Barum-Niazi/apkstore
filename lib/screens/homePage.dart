import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';
import 'package:flutter_game_shop_ui/functions/customDrawer.dart';
import 'package:flutter_game_shop_ui/screens/descriptionPage.dart';
import 'package:flutter_game_shop_ui/functions/newAppWidget.dart';
import 'package:flutter_game_shop_ui/tools/border.dart';
import 'package:flutter_game_shop_ui/tools/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_game_shop_ui/functions/appOverviewWidget.dart';

import '../tools/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      return posts;
    } else {
      return [];
    }
  }

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
                                        color: Colors.grey.shade300,
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
                                      color: Colors.grey.shade300,
                                      borderRadius:
                                          getBorderRadiusWidget(context, 0.03),
                                    ),
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
                                              setState(() {
                                                name = value;
                                              });
                                            },
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    descriptionScreen(
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
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.02,
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Upcoming Titles',
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
                                    AppOverViewWidget(
                                      width: width,
                                      height: height,
                                      imageName: 'assets/pic6.jpg',
                                    ),
                                    GestureDetector(
                                      child: Hero(
                                        tag: 'pic3',
                                        child: AppOverViewWidget(
                                          width: width,
                                          height: height,
                                          imageName: 'assets/pic3.jpg',
                                        ),
                                      ),
                                    ),
                                    AppOverViewWidget(
                                      width: width,
                                      height: height,
                                      imageName: 'assets/pic2.jpg',
                                    ),
                                    Hero(
                                      tag: 'pic2',
                                      child: AppOverViewWidget(
                                        width: width,
                                        height: height,
                                        imageName: 'assets/pic5.jpg',
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
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: samplePosts.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    NewAppWidget(
                                      width: width,
                                      height: height,
                                      appList: [
                                        samplePosts[index],
                                      ],
                                      name: samplePosts[index].name,
                                      imageName: samplePosts[index].image1Url,
                                      category: samplePosts[index].category,
                                      rating: samplePosts[index].rating,
                                      id: index,
                                    ),
                                    SizedBox(height: height * 0.02),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: height * 0.02)
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
