import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_assets.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_food_app/features/checkout/widgets/payment_methods_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                const Gap(20),

                /// settings icon
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: AppColors.secondary,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.secondary, width: 2),
                    image: const DecorationImage(
                      image: AssetImage(AppAsset.profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(25),

                // حقل الاسم الكامل
                CustomTextFormField(
                  labelText: 'Name',
                  controller: TextEditingController(text: 'Ahmed Elgendy'),
                  readOnly: true,
                ),

                const Gap(25),

                // 2. حقل البريد
                CustomTextFormField(
                  labelText: 'Email',
                  controller: TextEditingController(
                    text: 'AhmedElgendy23@gmail.com',
                  ),
                  readOnly: true,
                ),

                const Gap(25),

                // 3. حقل العنوان
                CustomTextFormField(
                  labelText: 'Delivery address',
                  controller: TextEditingController(
                    text: 'Sentrees, Ashmone, Egypt',
                  ),
                  readOnly: true,
                ),
                const Gap(25),
                Divider(color: AppColors.secondary, thickness: 1),
                const Gap(25),
                PaymentMethodsCard(
                  title: "Debit card",
                  subtitle: "**** **** **** 1234",
                  image: AppAsset.visaImage,
                  backgroundColor: AppColors.background,
                  isSelected: true,
                  onTap: () {},
                ),
                const Gap(30),
              ],
            ),
          ),

          /// Buttons Section
        ],

        /// Buttons Section
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                buttonColor: AppColors.secondary,
                buttonText: 'Edit Profile ',
                icon: Icons.edit,
                radius: 16,
                height: 55,
                onTap: () {},
              ),
            ),
            const Gap(20),
            Expanded(
              flex: 1,
              child: CustomButton(
                buttonText: 'Log out',
                icon: Icons.logout,
                radius: 16,
                height: 58,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
