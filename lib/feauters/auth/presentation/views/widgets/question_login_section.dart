import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/core/utils/go_route.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routes.kRegisterView);
          },
          child: const Text(
            "Register",
            style: TextStyle(
              color: Color(0xFF3AAFB8),
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
