import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(gradient: backgroundColor()),
          height: 60,
          child: Center(
            child: isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : Text(
                    text,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
