import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_food_app/features/auth/view/sign_in_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers for the text fields
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    //key for the form
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // logo
                    AppLogo(animateQuestionMark: false),
                    const Gap(20),
                    // text fields
                    CustomTextFormField(
                      labelText: 'Full Name',
                      controller: nameController,
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      labelText: 'Password',
                      isPassword: true,
                      controller: passwordController,
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      labelText: 'Confirm Password',
                      isPassword: true,
                      controller: confirmPasswordController,
                    ),
                    const Gap(50),
                    // button
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            buttonText: 'Sign in',
                            textSize: 12,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInView(),
                                ),
                              );
                            },
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          flex: 4,
                          child: CustomButton(
                            buttonColor: AppColors.secondary,
                            buttonText: 'Sign Up',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                // Perform sign-up logic here
                                String email = emailController.text;
                                String password = passwordController.text;
                                String name = nameController.text;
                                // You can call your authentication service here
                                // ignore: avoid_print
                                print(
                                  '❤️Success Login \n name: $name, Email: $email, Password: $password',
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gap(70),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
