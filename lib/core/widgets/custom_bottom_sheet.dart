import 'package:flutter/material.dart';
import 'package:hungry_food_app/features/product/widgets/total_section.dart';
// استورد ملفاتك هنا
// import 'package:hungry_food_app/core/widgets/total_section.dart';
// import 'package:hungry_food_app/core/widgets/success_dialog.dart';

class CustomBottomSheet extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final double accountTotal;
  final double height;

  const CustomBottomSheet({
    super.key,
    required this.buttonText,
    this.onTap,
    required this.accountTotal,
    this.height = 110.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: TotalSection(
          textButton: buttonText,
          onTap: onTap,
          accountTotal: accountTotal,
        ),
      ),
    );
  }
}
