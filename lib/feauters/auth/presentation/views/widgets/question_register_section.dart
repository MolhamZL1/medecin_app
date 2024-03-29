import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/constants.dart';

class QuistionLoginSection extends StatelessWidget {
  const QuistionLoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "have an account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: kColor,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
