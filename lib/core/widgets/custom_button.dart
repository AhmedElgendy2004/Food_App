import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    this.onTap,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.textSize = 17,
  });

  final String buttonText;
  final Color buttonColor;
  final Function()? onTap;
  final double width;
  final EdgeInsetsGeometry margin;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: AppColors.secondary, width: 4),
          borderRadius: BorderRadius.circular(10),
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
