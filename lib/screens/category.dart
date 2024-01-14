import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apk_store/appinfo.dart';
import 'package:flutter_apk_store/functions/customDrawer.dart';
import 'package:flutter_apk_store/screens/descriptionPage.dart';
import 'package:flutter_apk_store/functions/newAppWidget.dart';
import 'package:flutter_apk_store/screens/homeDark.dart';
import 'package:flutter_apk_store/tools/border.dart';
import 'package:flutter_apk_store/tools/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_apk_store/functions/appOverviewWidget.dart';

import '../tools/styles.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key, required this.category2}) : super(key: key);
  final String category2;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
    final response =
        await http.get(Uri.parse('https://appstash-api.onrender.com/'));
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
      color: themeRed1,
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
                                      Navigator.pop(context);
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
                                        Icons.arrow_back,
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
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: samplePosts.length,
                              itemBuilder: (context, index) {
                                // if (samplePosts[index].category ==
                                //     widget.category2) {
                                return Column(
                                  children: [
                                    if (samplePosts[index].category ==
                                        widget.category2)
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
                                    //  SizedBox(height: height * 0.02),
                                  ],
                                );
                                //}
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
