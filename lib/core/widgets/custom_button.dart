import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_text.dart';
import 'package:hungry_food_app/core/widgets/tap_effect.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor = AppColors.primary,
    required this.buttonText,
    this.height = 50,
    this.onTap,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.textSize = 17,
    this.radius = 10,
    this.enableAnimation = true,
    this.icon,
    this.iconIsLift = false,
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
  final IconData? icon;
  final bool iconIsLift;

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
          border: Border.all(
            color: (buttonColor == AppColors.secondary)
                ? AppColors.primary
                : AppColors.secondary,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: unnecessary_null_comparison
            if (Icon != null && iconIsLift)
              Icon(
                icon,
                color: (buttonColor == AppColors.secondary)
                    ? AppColors.primary
                    : AppColors.secondary,
              ),
            CustomText(
              text: buttonText,
              size: textSize,
              color: (buttonColor == AppColors.secondary)
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
            // ignore: unnecessary_null_comparison
            if (Icon != null && !iconIsLift)
              Icon(
                icon,
                color: (buttonColor == AppColors.secondary)
                    ? AppColors.primary
                    : AppColors.secondary,
              ),
          ],
        ),
      ),
    );
  }
}
