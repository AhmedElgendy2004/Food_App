import 'package:flutter/material.dart';
import 'package:hungry_food_app/features/orderHistory/widgets/order_history_card.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

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
                  return OrderHistoryCard();
                },
              ),
            ),

            /// Total Section
          ],
        ),
      ),
    );
  }
}
