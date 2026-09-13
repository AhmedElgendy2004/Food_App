import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
  });

  final String labelText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

bool _isVisible = true;

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    _isVisible = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: TextFormField(
        controller: widget.controller,

        cursorColor: Colors.white,
        cursorHeight: 20,
        style: TextStyle(color: Colors.white),
        //  validator
        validator: (v) {
          if (v == null || v.isEmpty) {
            return 'Please enter ${widget.labelText}';
          }
          return null;
        },
        obscureText: _isVisible,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: _isVisible
                      ? Icon(CupertinoIcons.eye, color: Colors.white)
                      : Icon(CupertinoIcons.eye_slash, color: Colors.white),
                )
              : null,

          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          // Border styles
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(14.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(14.0),
          ),
          //Error style
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(14.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
    );
  }
}
