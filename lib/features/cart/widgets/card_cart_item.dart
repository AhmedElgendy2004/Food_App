import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_assets.dart';
import 'package:hungry_food_app/features/cart/widgets/quantity_selector.dart';

class CardCartItem extends StatelessWidget {
  const CardCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAsset.bergerImage),
                  const Text(
                    "Burger",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text("Veggie Burger", textAlign: TextAlign.center),
                ],
              ),
            ),
            Expanded(flex: 1, child: QuantitySelector()),
          ],
        ),
      ),
    );
  }
}
