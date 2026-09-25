import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/widgets/custom_bottom_sheet.dart';
import 'package:hungry_food_app/features/checkout/widgets/invoice_card.dart';
import 'package:hungry_food_app/features/checkout/widgets/payment_section.dart';
import 'package:hungry_food_app/features/checkout/widgets/success_dialog.dart';

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
      bottomSheet: CustomBottomSheet(
        buttonText: 'Pay Now',
        accountTotal: 18.19,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SuccessDialog(),
          );
        },
      ),
    );
  }
}
