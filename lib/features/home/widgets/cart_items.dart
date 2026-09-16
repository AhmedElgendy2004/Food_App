import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_assets.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.rating = 3.5});

  final double rating; // Example rating value

  IconData _getStarIcon(int index) {
    // index يبدأ من 0 حتى 4
    if (rating >= index + 1) {
      return Icons.star; // نجمة كاملة
    } else if (rating >= index + 0.5) {
      return Icons.star_half; // نصف نجمة
    } else {
      return Icons.star_border; // نجمة فارغة
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AppAsset.bergerImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Food Item 1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Gap(5),
                Text('\$35.00', style: TextStyle(color: AppColors.primary)),
                Gap(5),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      _getStarIcon(starIndex),
                      color: Colors.amber,
                      size: 16,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
