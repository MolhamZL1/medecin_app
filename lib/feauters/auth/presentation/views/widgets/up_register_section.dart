import 'package:flutter/material.dart';

class UpRegisterSection extends StatelessWidget {
  const UpRegisterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Image.asset(
          "assets/images/register.png",
          height: 150,
        ),
        const SizedBox(height: 10),
        const Text(
          "Register",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
