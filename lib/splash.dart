import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_assets.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/core/widgets/app_logo.dart';
import 'package:hungry_food_app/features/auth/view/sign_in_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<double> _imageFadeAnimation;
  late Animation<double> _imageScaleAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد أنيميشن ظهور الصورة في ثانيتين
    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _imageFadeAnimation = CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOutCubic,
    );

    _imageScaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOutCubic),
    );

    _imageController.forward();

    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInView()),
      );
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(flex: 2),
            const Hero(
              tag: 'app_logo_hero',
              child: Material(color: Colors.transparent, child: AppLogo()),
            ),
            const Spacer(flex: 2),
            FadeTransition(
              opacity: _imageFadeAnimation,
              child: ScaleTransition(
                scale: _imageScaleAnimation,
                child: Image.asset(AppAsset.splashImage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
