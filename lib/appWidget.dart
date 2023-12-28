import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';
import 'package:flutter_game_shop_ui/screens/apidescription.dart';
import 'package:flutter_game_shop_ui/tools/border.dart';
import 'package:flutter_game_shop_ui/tools/colors.dart';
import 'package:http/http.dart' as http;

import 'tools/styles.dart';

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
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: getBorderRadiusWidget(context, 0.05),
                child: Image.network(
                  imageName,
                  width: width * 0.4,
                  height: height,
                  fit: BoxFit.contain,
                  alignment: Alignment.topRight,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textStyle4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      category,
                      style: textStyle5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.15,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.015,
                            vertical: height * 0.006,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: getBorderRadiusWidget(context, 1),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: width * 0.05,
                              ),
                              Text(
                                rating,
                                style: textStyle14,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: getShapeWidget(context, 1),
                            primary: Colors.white,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Install',
                            style: textStyle13,
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
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(width * 0.07),
          bottomRight: Radius.circular(width * 0.07),
          topRight: Radius.circular(width * 0.01),
          topLeft: Radius.circular(width * 0.01),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Container(
            width: width,
            height: height * 0.13,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: textStyle9,
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Action',
                  style: textStyle10,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: getBorderRadiusWidget(context, 1),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text(
                            star,
                            style: textStyle10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: getShapeWidget(context, 1),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05,
                          vertical: height * 0.008,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Install',
                        style: textStyle13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
