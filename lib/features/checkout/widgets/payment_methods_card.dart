import 'package:flutter/material.dart';

class PaymentMethodsCard extends StatelessWidget {
  const PaymentMethodsCard({
    super.key,
    required this.title,
    required this.image,
    this.subtitle,
    this.isSelected = false,
    this.onTap,
    this.backgroundColor,
    this.textColor = Colors.black,
  });

  final String title;
  final String? subtitle;
  final bool isSelected;
  final VoidCallback? onTap;
  final String image;
  final Color textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(image),
        trailing: Icon(
          isSelected ? Icons.check_circle : Icons.circle_outlined,
          color: isSelected ? Colors.green : Colors.grey,
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              )
            : null,
      ),
    );
  }
}
