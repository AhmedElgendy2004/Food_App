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
            buttonQuantity(
              onTap: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
              icon: Icons.remove,
              isRight: false,
            ),
            SizedBox(
              width: 50,
              child: CustomText(
                text: "$quantity",
                color: AppColors.primary,
                size: 20,
              ),
            ),
            buttonQuantity(
              isRight: true,
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              icon: Icons.add,
            ),
          ],
        ),
        const Gap(20),

        /// Remove Button
        CustomButton(
          enableAnimation: false,
          buttonText: "Remove",
          icon: Icons.delete,
          width: 140,
          onTap: () {
            setState(() {
              quantity = 0;
            });
          },
          radius: 29,
        ),
      ],
    );
  }
}

Widget buttonQuantity({
  required VoidCallback onTap,
  required IconData icon,
  required bool isRight,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          // إذا كان الزر (+) تُدوّر الحواف اليمنى
          topRight: Radius.circular(isRight ? 20 : 0),
          bottomRight: Radius.circular(isRight ? 20 : 0),
          // إذا كان الزر (-) تُدوّر الحواف اليسرى
          topLeft: Radius.circular(isRight ? 0 : 20),
          bottomLeft: Radius.circular(isRight ? 0 : 20),
        ),
      ),
      child: Icon(icon, color: AppColors.secondary),
    ),
  );
}
