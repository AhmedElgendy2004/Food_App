import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color = AppColors.secondary,
    this.size = 12,
    this.fontWeight = FontWeight.normal,
    this.textAlign = Alignment.center,
    this.baseTextStyle,
    this.padding = 8,
  });

  final String text;
  final Color? color;
  final double size;
  final FontWeight fontWeight;
  final Alignment textAlign;
  final TextStyle? baseTextStyle;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle =
        baseTextStyle ?? GoogleFonts.luckiestGuy(fontSize: size, color: color);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Align(
        alignment: textAlign,
        child: Text(text, style: effectiveStyle),
      ),
    );
  }
}
