import 'package:flutter/material.dart';
import 'package:hungry_food_app/features/cart/widgets/card_cart_item.dart';
import 'package:hungry_food_app/features/checkout/view/checkout_view.dart';
import 'package:hungry_food_app/features/product/widgets/total_section.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            /// Cart Items List
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const CardCartItem();
                },
              ),
            ),

            /// Total Section
            TotalSection(
              accountTotal: 18.19,
              textButton: 'checkout',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckoutView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
