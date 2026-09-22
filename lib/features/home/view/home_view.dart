import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/features/home/widgets/cart_items.dart';
import 'package:hungry_food_app/features/home/widgets/categories_bar.dart';
import 'package:hungry_food_app/features/home/widgets/home_app_bar.dart';
import 'package:hungry_food_app/features/home/widgets/search_field.dart';
import 'package:hungry_food_app/features/product/view/product_details_view.dart';

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
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.background,
                toolbarHeight: 200,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// App Logo and User Name
                    const Gap(30),
                    const HomeAppBar(),
                    const Gap(10),

                    /// search bar
                    SearchField(),
                    const Gap(10),

                    /// categories
                    const CategoriesBar(),
                    const Gap(10),
                  ],
                ),
              ),

              /// Spacing
              SliverToBoxAdapter(child: const Gap(10)),

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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailsView(),
                        ),
                      );
                    },
                    child: CartItems(),
                  );
                }, childCount: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
