import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_text.dart';
import 'package:hungry_food_app/core/widgets/tap_effect.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    this.height = 50,
    this.onTap,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.textSize = 17,
    this.radius = 10,
    this.enableAnimation = true,
  });

  final String buttonText;
  final Color buttonColor;
  final Function()? onTap;
  final double width;
  final double height;
  final double radius;
  final EdgeInsetsGeometry margin;
  final double textSize;
  final bool enableAnimation;

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      enableAnimation: enableAnimation,
      onClick: onTap,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: AppColors.secondary, width: 4),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: CustomText(
          text: buttonText,
          size: textSize,
          color: (buttonColor == AppColors.secondary)
              ? AppColors.primary
              : AppColors.secondary,
        ),
      ),
    );
  }
}
