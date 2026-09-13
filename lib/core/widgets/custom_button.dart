import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.buttonText, this.onPressed,
  });

  final String buttonText;
  final Color buttonColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14.0),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: AppColors.secondary, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
      
        child: CustomText(
          text: buttonText,
          size: 17,
          color: (buttonColor == AppColors.secondary)
              ? AppColors.primary
              : AppColors.secondary,
        ),
      ),
    );
  }
}
