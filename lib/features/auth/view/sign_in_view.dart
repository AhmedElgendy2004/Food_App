import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/core/widgets/custom_button.dart';
import 'package:hungry_food_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_food_app/features/auth/view/sign_up_view.dart';
import 'package:hungry_food_app/features/auth/widgets/create_slide_route.dart';
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
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: SingleChildScrollView(
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
                    const Gap(60),

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
                    const Gap(60),

                    // 4. Buttons Hero
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Hero(
                            tag: 'primary_action_btn_hero',
                            flightShuttleBuilder: _flightShuttleBuilder,
                            child: Material(
                              color: Colors.transparent,
                              child: CustomButton(
                                buttonColor: AppColors.secondary,
                                buttonText: 'Sign In',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    final email = emailController.text;
                                    final password = passwordController.text;
                                    debugPrint('❤️ Login: $email, $password');
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        const Gap(5),
                        Expanded(
                          flex: 1,
                          child: Hero(
                            tag: 'secondary_action_btn_hero',
                            flightShuttleBuilder: _flightShuttleBuilder,
                            child: Material(
                              color: Colors.transparent,
                              child: CustomButton(
                                buttonText: 'Sign up -->>',
                                textSize: 12,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    createSlideRoute(const SignUpView()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),

                    // 5. زر التخطي المؤقت إلى صفحة الـ Root
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Root()),
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
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Gap(20),
                  ],
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
