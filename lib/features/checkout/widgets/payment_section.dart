import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_assets.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/features/checkout/widgets/payment_methods_card.dart';

enum PaymentType { cashOnDelivery, debitCard }

bool isCardSaved = true;

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  PaymentType selectedPayment = PaymentType.cashOnDelivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // كارت الدفع عند الاستلام
        PaymentMethodsCard(
          title: "Cash on delivery",
          textColor: AppColors.background,
          image: AppAsset.dollarImage,
          backgroundColor: AppColors.backgroundCard,
          isSelected: selectedPayment == PaymentType.cashOnDelivery,
          onTap: () {
            setState(() {
              selectedPayment = PaymentType.cashOnDelivery;
            });
          },
        ),
        const Gap(10),

        // كارت الفيزا / بطاقة الخصم
        PaymentMethodsCard(
          title: "Debit card",
          subtitle: "**** **** **** 1234",
          image: AppAsset.visaImage,
          backgroundColor: AppColors.background,
          isSelected: selectedPayment == PaymentType.debitCard,
          onTap: () {
            setState(() {
              selectedPayment = PaymentType.debitCard;
            });
          },
        ),

        Gap(10),
        Row(
          children: [
            Checkbox(
              activeColor: AppColors.spicy,
              value: isCardSaved,
              onChanged: (value) {
                setState(() {
                  isCardSaved = value!;
                });
              },
            ),
            const Text(
              "Save this card for future payments",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
