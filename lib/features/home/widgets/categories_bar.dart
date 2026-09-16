import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({super.key});

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  List<String> categories = ["All", "Pizza", "Burger", "Pasta", "Dessert"];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              decoration: BoxDecoration(
                color: selectedCategoryIndex == index
                    ? AppColors.primary
                    : AppColors.categoryButton,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 14,
                  color: selectedCategoryIndex == index
                      ? Colors.white
                      : AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
