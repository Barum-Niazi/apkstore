import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';
import 'package:flutter_game_shop_ui/screens/apidescription.dart';
import 'package:flutter_game_shop_ui/tools/border.dart';
import 'package:flutter_game_shop_ui/tools/colors.dart';
import 'package:http/http.dart' as http;

import '../tools/styles.dart';

class NewAppWidget extends StatelessWidget {
  const NewAppWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imageName,
    required this.name,
    required this.category,
    required this.rating,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageName;
  final String name;
  final String rating;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                        color: redColor1,
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
                              borderRadius: BorderRadius.circular(width * 0.05),
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
                            onPressed: () {},
                            child: const Text(
                              'Install',
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
    );
  }
}

class GameOverViewWidget extends StatelessWidget {
  const GameOverViewWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imageName,
    required this.name,
    required this.star,
  }) : super(key: key);

  final double width;
  final double height;

  final String imageName;
  final String name;
  final String star;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      alignment: Alignment.bottomCenter,
      width: width * 0.45,
      height: height * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageName),
          fit: BoxFit.cover,
        ),
        borderRadius: getBorderRadiusWidget(context, 0.07),
      ),
    );
  }
}
