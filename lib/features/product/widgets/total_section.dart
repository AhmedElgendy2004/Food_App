import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';

class TotalSection extends StatelessWidget {
  const TotalSection({
    super.key,
    this.accountTotal = 18.19,
    required this.textButton,
    this.onTap,
  });

  final double accountTotal;
  final String textButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "💲$accountTotal",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomButton(
              buttonColor: AppColors.primary,
              buttonText: textButton,
              height: 60,
              radius: 18,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
