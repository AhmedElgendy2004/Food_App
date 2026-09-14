import 'package:flutter/material.dart';
import 'package:hungry_food_app/features/auth/view/sign_up_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hungry App',
      home: SignUpView(),
    );
  }
}
