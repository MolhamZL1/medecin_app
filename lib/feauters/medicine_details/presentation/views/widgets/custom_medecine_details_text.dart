import 'package:flutter/material.dart';

class CustomMedecineDetailsText extends StatelessWidget {
  const CustomMedecineDetailsText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 20,
      ),
    );
  }
}
