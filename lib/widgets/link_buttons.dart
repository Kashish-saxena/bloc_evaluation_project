import 'package:flutter/material.dart';

class LinkButtonWidget extends StatefulWidget {
  const LinkButtonWidget({super.key});

  @override
  State<LinkButtonWidget> createState() => _LinkButtonWidgetState();
}

class _LinkButtonWidgetState extends State<LinkButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Image.asset("assets/images/facebook.png", fit: BoxFit.contain),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {},
          child: Image.asset(
            "assets/images/google.png",
            fit: BoxFit.contain,
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {},
          child: Image.asset(
            "assets/images/apple.png",
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
