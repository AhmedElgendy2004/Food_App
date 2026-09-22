import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_food_app/features/auth/view/sign_up_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers for the text fields
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    //key for the form
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  AppLogo(animateQuestionMark: false),
                  const Gap(100),
                  // text fields
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
                  const Gap(100),
                  // button
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomButton(
                          buttonColor: AppColors.secondary,
                          buttonText: 'Sign In',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              // Perform sign-in logic here
                              String email = emailController.text;
                              String password = passwordController.text;
                              // You can call your authentication service here
                              // ignore: avoid_print
                              print(
                                '❤️Success Login \n Email: $email, Password: $password',
                              );
                            }
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          buttonText: 'Sign up',
                          textSize: 12,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpView(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
