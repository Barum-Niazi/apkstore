import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_apk_store/appinfo.dart';
import 'package:flutter_apk_store/screens/descriptionPage.dart';
import 'package:flutter_apk_store/tools/border.dart';
import 'package:flutter_apk_store/tools/colors.dart';

import '../tools/styles.dart';

class NewAppWidget extends StatelessWidget {
  const NewAppWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.imageName,
      required this.name,
      required this.category,
      required this.rating,
      required this.id,
      required this.appList})
      : super(key: key);
  final int id;
  final double width;
  final double height;
  final String imageName;
  final String name;
  final String rating;
  final String category;
  final List<AppInfo> appList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => descriptionScreen(
                    appList: appList,
                    currentIndex: id,
                    name: name,
                  )),
        );
      },
      child: Center(
        child: Container(
          width: width * 0.9,
          height: height * 0.16,
          padding: EdgeInsets.only(
            left: 0.01 * width,
            top: height * 0.01,
            bottom: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: getBorderRadiusWidget(context, 0.05),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: getBorderRadiusWidget(context, 0.05),
                  child: Image.network(
                    imageName,
                    width: width * 0.5,
                    height: height,
                    fit: BoxFit.contain,
                    alignment: Alignment.topRight,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text('Failed to load image'));
                    },
                  ),
                ),
              ),
              SizedBox(width: width * 0.03),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: themeRed1,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w800,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        //show the stars in the container
                        children: List.generate(
                          double.parse(rating).round(),
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 15,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.25,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.015,
                              vertical: height * 0.006,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: getBorderRadiusWidget(context, 1),
                            ),
                            child: SizedBox(
                              width: width * 0.25,
                              child: Text(
                                category,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: width * 0.02),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.05),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 7,
                                    offset: const Offset(2, 2),
                                  ),
                                ]),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.05),
                                ),
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => descriptionScreen(
                                            appList: appList,
                                            currentIndex: id,
                                            name: name,
                                          )),
                                );
                              },
                              child: const Text(
                                'View',
                                style: textStyle13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
