import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),

      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: 'Search ',
          prefixIcon: Icon(CupertinoIcons.search, size: 30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
