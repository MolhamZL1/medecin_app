import 'package:flutter/material.dart';

class UpSection extends StatelessWidget {
  const UpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 75),
        Image.asset(
          "assets/images/Login.png",
          height: 150,
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
