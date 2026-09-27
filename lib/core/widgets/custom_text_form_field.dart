import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.isPassword = false,
    this.readOnly = false, // خيار القراءة فقط (افتراضياً false للـ Auth)
  });

  final String labelText;
  final bool isPassword;
  final TextEditingController? controller;
  final bool readOnly;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly, // منع التعديل وفتح الكيبورد
      enableInteractiveSelection: !widget.readOnly, // منع التحديد في شاشة العرض
      cursorColor: Colors.white,
      cursorHeight: 20,

      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      validator: (v) {
        if (!widget.readOnly && (v == null || v.isEmpty)) {
          return 'Please enter ${widget.labelText}';
        }
        return null;
      },
      obscureText: _isVisible,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior
            .always, // يجعل الـ Label دائمًا أعلى الإطار كما في الصورة
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: Icon(
                  _isVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: Colors.white,
                ),
              )
            : null,
        labelText: widget.labelText,

        labelStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.8),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        // حدود الحقل
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
