import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: backgroundColor(),
        height: 60,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
