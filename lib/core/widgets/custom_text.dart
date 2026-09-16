import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color = AppColors.secondary,
    this.size = 14,
    this.fontWeight = FontWeight.w200,
    this.textAlign = Alignment.center,
    this.padding = 8,
    this.fontFamily = 'LuckiestGuy',
  });

  final String text;
  final Color? color;
  final double size;
  final FontWeight fontWeight;
  final Alignment textAlign;
  final String fontFamily;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Align(
        alignment: textAlign,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
