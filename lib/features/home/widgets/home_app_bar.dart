import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLogo(
              fontSize: 42,
              color: AppColors.primary,
              animateQuestionMark: false,
            ),
            Text(
              'Hello , Ahmed Elgendy',
              style: TextStyle(color: AppColors.primary, fontSize: 14),
            ),
          ],
        ),
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.person, color: Colors.white, size: 24),
        ),
      ],
    );
  }
}
