import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/features/home/widgets/cart_items.dart';
import 'package:hungry_food_app/features/home/widgets/categories_bar.dart';
import 'package:hungry_food_app/features/home/widgets/home_app_bar.dart';
import 'package:hungry_food_app/features/home/widgets/search_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CustomScrollView(
            slivers: [
              ///AppBar
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Gap(45),

                    /// App bar
                    const HomeAppBar(),
                    const Gap(10),

                    /// search bar
                    SearchField(),
                    Gap(20),

                    /// categories
                    const CategoriesBar(),
                    Gap(20),
                  ],
                ),
              ),

              /// Cart Items
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  return CartItems();
                }, childCount: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
