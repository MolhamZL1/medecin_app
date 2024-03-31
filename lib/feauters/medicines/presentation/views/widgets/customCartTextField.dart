import 'package:flutter/material.dart';

class CustomTextCard extends StatelessWidget {
  const CustomTextCard({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
