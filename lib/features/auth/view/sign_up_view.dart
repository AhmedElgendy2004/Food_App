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
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 1. Logo Hero
                      const Hero(
                        tag: 'app_logo_hero',
                        child: Material(
                          color: Colors.transparent,
                          child: AppLogo(animateQuestionMark: false),
                        ),
                      ),
                      const Gap(20),

                      // حقل خاص بهذه الشاشة فقط (ينزلق تلقائياً مع الراوت)
                      CustomTextFormField(
                        labelText: 'Full Name',
                        controller: nameController,
                      ),
                      const Gap(10),

                      // 2. Email Field Hero
                      Hero(
                        tag: 'email_field_hero',
                        flightShuttleBuilder: _flightShuttleBuilder,
                        child: Material(
                          color: Colors.transparent,
                          child: CustomTextFormField(
                            labelText: 'Email',
                            controller: emailController,
                          ),
                        ),
                      ),
                      const Gap(10),

                      // 3. Password Field Hero
                      Hero(
                        tag: 'password_field_hero',
                        flightShuttleBuilder: _flightShuttleBuilder,
                        child: Material(
                          color: Colors.transparent,
                          child: CustomTextFormField(
                            labelText: 'Password',
                            isPassword: true,
                            controller: passwordController,
                          ),
                        ),
                      ),
                      const Gap(10),

                      // حقل خاص بهذه الشاشة فقط
                      CustomTextFormField(
                        labelText: 'Confirm Password',
                        isPassword: true,
                        controller: confirmPasswordController,
                      ),
                      const Gap(40),

                      // 4. Buttons Hero
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Hero(
                              tag: 'secondary_action_btn_hero',
                              flightShuttleBuilder: _flightShuttleBuilder,
                              child: Material(
                                color: Colors.transparent,
                                child: CustomButton(
                                  buttonText: '<<-- Sign in',
                                  textSize: 12,
                                  onTap: () => Navigator.pop(context),
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                            flex: 3,
                            child: Hero(
                              tag: 'primary_action_btn_hero',
                              flightShuttleBuilder: _flightShuttleBuilder,
                              child: Material(
                                color: Colors.transparent,
                                child: CustomButton(
                                  buttonColor: AppColors.secondary,
                                  buttonText: 'Sign Up',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      final email = emailController.text;
                                      final password = passwordController.text;
                                      final name = nameController.text;
                                      debugPrint(
                                        '❤️ SignUp: $name, $email, $password',
                                      );
                                    }
                                  },
                                ),
                              ),
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
        ),
      ),
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: fromHeroContext.widget,
    );
  }
}
