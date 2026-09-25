import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_food_app/features/auth/view/sign_up_view.dart';
import 'package:hungry_food_app/root.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Gap(70),
                          // 1. Logo Hero
                          const Hero(
                            tag: 'app_logo_hero',
                            child: Material(
                              color: Colors.transparent,
                              child: AppLogo(
                                animateQuestionMark: false,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const Gap(70),

                          // 2. Container Hero (يتمدد ويتقلص بين الصفحتين)
                          Expanded(
                            child: Hero(
                              tag: 'bottom_sheet_container_hero',
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 24.0,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Gap(30),

                                      // حقل الإيميل
                                      CustomTextFormField(
                                        labelText: 'Email',
                                        controller: emailController,
                                      ),
                                      const Gap(12),

                                      // حقل الباسورد
                                      CustomTextFormField(
                                        labelText: 'Password',
                                        isPassword: true,
                                        controller: passwordController,
                                      ),
                                      const Gap(32),

                                      // صف الأزرار
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: CustomButton(
                                              buttonColor: AppColors.secondary,
                                              buttonText: 'Sign In',
                                              onTap: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  final email =
                                                      emailController.text;
                                                  final password =
                                                      passwordController.text;
                                                  debugPrint(
                                                    '❤️ Login: $email, $password',
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          const Gap(8),
                                          Expanded(
                                            flex: 1,
                                            child: CustomButton(
                                              buttonText: 'Sign up -->>',
                                              textSize: 12,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUpView(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(20),

                                      // زر التخطي المؤقت
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Root(),
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor: AppColors.secondary,
                                          splashFactory: NoSplash.splashFactory,
                                        ),
                                        child: const Text(
                                          'Skip for now ->',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
