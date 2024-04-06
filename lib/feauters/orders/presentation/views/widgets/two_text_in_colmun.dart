import 'package:flutter/material.dart';

class TwoTextINColumn extends StatelessWidget {
  const TwoTextINColumn({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title:", style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          info,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
