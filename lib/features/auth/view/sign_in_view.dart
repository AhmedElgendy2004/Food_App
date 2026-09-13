import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text_form_field.dart';

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
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 10),
                // logo
                AppLogo(animateQuestionMark: false),
                Spacer(flex: 4),
                // text fields
                CustomTextFormField(
                  labelText: 'Email',
                  controller: emailController,
                ),
                Spacer(flex: 1),
                CustomTextFormField(
                  labelText: 'Password',
                  isPassword: true,
                  controller: passwordController,
                ),
                Spacer(flex: 10),
                // button
                CustomButton(
                  buttonColor: AppColors.secondary,
                  buttonText: 'Sign In',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Perform sign-in logic here
                      String email = emailController.text;
                      String password = passwordController.text;
                      // You can call your authentication service here
                      // ignore: avoid_print
                      print(
                        '🤍Success Login \n Email: $email, Password: $password',
                      );
                    }
                  },
                ),
                Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
