import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              enableAnimation: false,

              buttonText: "-",
              textSize: 24,
              onTap: () {
                if (quantity > 1) {
                  setState(() {
                    if (quantity > 1) {
                      quantity--;
                    }
                  });
                }
              },
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 50,
              child: CustomText(
                text: "$quantity",
                color: AppColors.primary,
                size: 20,
              ),
            ),
            CustomButton(
              enableAnimation: false,
              buttonText: "+",
              textSize: 24,
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              width: 40,
              height: 40,
            ),
          ],
        ),
        const Gap(20),

        /// Remove Button
        CustomButton(
          enableAnimation: false,
          buttonText: "Remove",
          onTap: () {
            setState(() {
              quantity = 0;
            });
          },
          radius: 24,
          width: 125,
        ),
      ],
    );
  }
}
