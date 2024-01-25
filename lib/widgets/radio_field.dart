import 'package:flutter/material.dart';

class RadioFieldWidget extends StatelessWidget {
  const RadioFieldWidget({
    super.key,
    required this.widget,
  });

  final Widget widget;

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
      child: widget,
    );
  }
}
