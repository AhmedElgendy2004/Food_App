import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/features/checkout/widgets/invoice_card.dart';
import 'package:hungry_food_app/features/checkout/widgets/payment_section.dart';
import 'package:hungry_food_app/features/checkout/widgets/success_dialog.dart';
import 'package:hungry_food_app/features/product/widgets/total_section.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Order summary
              const Text(
                "Order summary",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const InvoiceCard(
                orderCost: 16.48,
                taxes: 0.3,
                deliveryFees: 1.5,
                minEstimatedDeliveryTime: 10,
                maxEstimatedDeliveryTime: 15,
              ),

              const Gap(30),

              /// Payment methods
              const Text(
                "Payment methods",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              const PaymentSection(),
              const Gap(110),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        height: 110.0,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0),
          child: TotalSection(
            textButton: 'Pay Now',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SuccessDialog();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
