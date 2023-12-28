import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/tools/border.dart';

class AppOverViewWidget extends StatelessWidget {
  const AppOverViewWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imageName,
  }) : super(key: key);

  final double width;
  final double height;

  final String imageName;

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
