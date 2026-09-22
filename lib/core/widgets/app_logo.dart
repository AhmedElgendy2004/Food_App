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

class _AppLogoState extends State<AppLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // حركة ميلان بسيطة توحي بالتساؤل والحيرة
    _rotationAnimation =
        Tween<double>(
          begin: -0.08, // ميلان لليسار قليلاً
          end: 0.1, // ميلان لليمين مع هزة خفيفة
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
        );

    // نبضة حجم طفيفة مرافقة للميلان
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.animateQuestionMark) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant AppLogo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animateQuestionMark != oldWidget.animateQuestionMark) {
      if (widget.animateQuestionMark) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
        _controller.reset();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveQuestionColor = widget.questionMarkColor ?? widget.color;

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
        AnimatedBuilder(
          animation: _controller,
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
          child: RepaintBoundary(
            child: Text(
              ' ?',
              style: TextStyle(
                fontFamily: 'LuckiestGuy',
                fontSize: widget.fontSize,
                color: effectiveQuestionColor,
              ),
            ),
          ),
        ),
      ],
    );

    if (widget.onTap != null) {
      return InkWell(
        onTap: widget.onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: content,
      );
    }

    return content;
  }
}
