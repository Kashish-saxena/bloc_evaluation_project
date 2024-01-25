import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.text,
    required this.obscureText,
    required this.controller,
    required this.validator,
  });
  final FormFieldValidator? validator;
  final String text;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF7F8F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffE8ECF4)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: const TextStyle(fontSize: 18, color: Color(0xff8391A1)),
        ),
      ),
    );
  }
}
