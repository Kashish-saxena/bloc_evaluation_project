import 'dart:developer';

import 'package:bloc_project/screens/register_screen.dart';
import 'package:bloc_project/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        log("$didPop");
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/images/img.png",
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 150,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "WELCOME",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 150, vertical: 15),
                        backgroundColor: const Color(0xff1E232C),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => UserScreen()),
                        //     (Route<dynamic> route) => false);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserScreen()));
                      },
                      child: const Text(
                        "Users Data",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 160, vertical: 15),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
