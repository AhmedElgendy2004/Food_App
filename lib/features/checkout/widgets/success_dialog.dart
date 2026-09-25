import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 66, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            const Icon(Icons.check_circle, color: AppColors.primary, size: 70),
            const SizedBox(height: 16),
            CustomText(
              text: "Success !",
              size: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            const SizedBox(height: 8),
            const Text(
              "Your payment was successful.\nA receipt for this purchase has been sent to your email.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            CustomButton(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              buttonText: "Go Back",
              radius: 16,
            ),
          ],
        ),
      ),
    );
  }
}
