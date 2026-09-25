import 'package:flutter/material.dart';

Route createSlideRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // حركة انزلاق تبدأ من اليمين وتنتهي في المنتصف
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final curve = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );

      final slideAnimation = Tween<Offset>(
        begin: begin,
        end: end,
      ).animate(curve);
      final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

      return SlideTransition(
        position: slideAnimation,
        child: FadeTransition(opacity: fadeAnimation, child: child),
      );
    },
  );
}
