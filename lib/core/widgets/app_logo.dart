import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class AppLogo extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color? questionMarkColor;
  final VoidCallback? onTap;
  final bool animateQuestionMark;

  const AppLogo({
    super.key,
    this.text = 'Hungry',
    this.fontSize = 48,
    this.color = AppColors.secondary,
    this.questionMarkColor,
    this.onTap,
    this.animateQuestionMark = true,
  });

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with TickerProviderStateMixin {
  late AnimationController _introController;
  late Animation<double> _introFadeAnimation;
  late Animation<double> _introScaleAnimation;

  late AnimationController _questionController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 1. متحكم الظهور الأولي
    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _introFadeAnimation = CurvedAnimation(
      parent: _introController,
      curve: Curves.easeOutCubic,
    );

    _introScaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _introController, curve: Curves.easeOutCubic),
    );

    // 2. متحكم حركة علامة الاستفهام
    _questionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _rotationAnimation = Tween<double>(begin: -0.08, end: 0.1).animate(
      CurvedAnimation(parent: _questionController, curve: Curves.easeInOutSine),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _questionController, curve: Curves.easeInOut),
    );

    // التحكم في تشغيل أو تخطي الأنيميشن
    if (widget.animateQuestionMark) {
      _introController.forward();
      _questionController.repeat(reverse: true);
    } else {
      // إيقاف وتثبيت القيم عند النهاية ليظهر العنصر مكتملاً بدون تأخير
      _introController.value = 1.0;
      _questionController.value = 0.0;
    }
  }

  @override
  void didUpdateWidget(covariant AppLogo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animateQuestionMark != oldWidget.animateQuestionMark) {
      if (widget.animateQuestionMark) {
        _introController.forward(from: 0.0);
        _questionController.repeat(reverse: true);
      } else {
        _introController.stop();
        _introController.value = 1.0;
        _questionController.stop();
        _questionController.reset();
      }
    }
  }

  @override
  void dispose() {
    _introController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveQuestionColor = widget.questionMarkColor ?? widget.color;

    // علامة الاستفهام (متحركة أو ثابتة)
    Widget questionMarkWidget = Text(
      ' ?',
      style: TextStyle(
        fontFamily: 'LuckiestGuy',
        fontSize: widget.fontSize,
        color: effectiveQuestionColor,
      ),
    );

    if (widget.animateQuestionMark) {
      questionMarkWidget = AnimatedBuilder(
        animation: _questionController,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.bottomCenter,
            transform: Matrix4.identity()
              ..rotateZ(_rotationAnimation.value)
              ..multiply(
                Matrix4.diagonal3Values(
                  _scaleAnimation.value,
                  _scaleAnimation.value,
                  1.0,
                ),
              ),
            child: child,
          );
        },
        child: RepaintBoundary(child: questionMarkWidget),
      );
    }

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontFamily: 'LuckiestGuy',
            fontSize: widget.fontSize,
            color: widget.color,
          ),
        ),
        questionMarkWidget,
      ],
    );

    // تطبيق أنيميشن الظهور فقط لو animateQuestionMark مفعلة
    Widget finalContent = widget.animateQuestionMark
        ? FadeTransition(
            opacity: _introFadeAnimation,
            child: ScaleTransition(scale: _introScaleAnimation, child: content),
          )
        : content;

    if (widget.onTap != null) {
      return InkWell(
        onTap: widget.onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: finalContent,
      );
    }

    return finalContent;
  }
}
