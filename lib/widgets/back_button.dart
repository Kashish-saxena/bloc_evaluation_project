import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 41,
          width: 41,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: const Color(0xffE8ECF4)),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ));
  }
}
