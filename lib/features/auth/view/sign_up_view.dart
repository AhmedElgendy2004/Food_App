import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                          const Gap(40),
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
                          const Gap(30),

                          // 2. Container Hero (يكبر تلقائياً ليستوعب الحقول الإضافية)
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
                                      const Gap(15),

                                      // حقل الاسم الكامل
                                      CustomTextFormField(
                                        labelText: 'Full Name',
                                        controller: nameController,
                                      ),
                                      const Gap(10),

                                      // حقل الإيميل
                                      CustomTextFormField(
                                        labelText: 'Email',
                                        controller: emailController,
                                      ),
                                      const Gap(10),

                                      // حقل الباسورد
                                      CustomTextFormField(
                                        labelText: 'Password',
                                        isPassword: true,
                                        controller: passwordController,
                                      ),
                                      const Gap(10),

                                      // حقل تأكيد كلمة المرور
                                      CustomTextFormField(
                                        labelText: 'Confirm Password',
                                        isPassword: true,
                                        controller: confirmPasswordController,
                                      ),
                                      const Gap(24),

                                      // صف الأزرار
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: CustomButton(
                                              buttonText: '<<-- Sign in',
                                              textSize: 12,
                                              onTap: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ),
                                          const Gap(8),
                                          Expanded(
                                            flex: 3,
                                            child: CustomButton(
                                              buttonColor: AppColors.secondary,
                                              buttonText: 'Sign Up',
                                              onTap: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  final email =
                                                      emailController.text;
                                                  final password =
                                                      passwordController.text;
                                                  final name =
                                                      nameController.text;
                                                  debugPrint(
                                                    '❤️ SignUp: $name, $email, $password',
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(20),
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
