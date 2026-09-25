// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({
    super.key,
    required this.orderCost,
    required this.taxes,
    required this.deliveryFees,
    required this.minEstimatedDeliveryTime,
    required this.maxEstimatedDeliveryTime,
  });

  final double orderCost;
  final double taxes;
  final double deliveryFees;
  final int minEstimatedDeliveryTime;
  final int maxEstimatedDeliveryTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textCard("Order"),
                    const Gap(12),
                    textCard("Taxes"),
                    const Gap(12),
                    textCard("Delivery fees"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textCard("\$$orderCost"),
                    const Gap(12),
                    textCard("\$$taxes"),
                    const Gap(12),
                    textCard("\$$deliveryFees"),
                  ],
                ),
              ],
            ),
            const Gap(20),

            Divider(color: Colors.grey, thickness: 1),
            const Gap(20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      "Estimated delivery time:",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textCard("\$ ${orderCost + taxes + deliveryFees}"),
                    const Gap(10),
                    textCard(
                      "$minEstimatedDeliveryTime - $maxEstimatedDeliveryTime min",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: strict_top_level_inference
Widget textCard(text) {
  return Text(text, style: TextStyle(fontSize: 16, color: AppColors.textCard));
}
