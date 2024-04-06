import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomDevider extends StatelessWidget {
  const CustomDevider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 45,
      width: 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: kColor,
      ),
    );
  }
}
