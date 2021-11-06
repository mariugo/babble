import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.onSaved,
    required this.regEx,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  final Function(String) onSaved;
  final String regEx;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: obscureText,
      validator: (_value) =>
          RegExp(regEx).hasMatch(_value!) ? null : 'Enter a valid value',
    );
  }
}
