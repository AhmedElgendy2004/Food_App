import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_assets.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/features/product/widgets/total_section.dart';
import 'package:hungry_food_app/features/product/widgets/spicy_selector_bar.dart';
import 'package:hungry_food_app/features/product/widgets/topping_card.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Header
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(AppAsset.bergerDetailesImage),
                  ),
                  const Gap(20),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Customize Your Burger\nto Your Tastes. \nUltimate Experience",
                          ),
                          const Gap(20),
                          const SpicySlider(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              ///spacer
              const Gap(20),

              ///Toppings
              const Text(
                "Toppings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(5),

              ///Toppings List
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => ToppingCard(
                      title: "Tomato",
                      imagePath: AppAsset.bergerToppingsImage,
                    ),
                  ),
                ),
              ),

              ///spacer
              const Gap(20),

              ///Side options
              const Text(
                "Side options",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(5),

              ///Side options List
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => ToppingCard(
                      title: "Fries",
                      imagePath: AppAsset.bergerSideOptionsImage,
                    ),
                  ),
                ),
              ),
              const Gap(20),

              /// Total Section
              const TotalSection(accountTotal: 18.19),
            ],
          ),
        ),
      ),
    );
  }
}
