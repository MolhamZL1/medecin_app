import 'package:flutter/material.dart';

void customshowSnackBar(BuildContext context,
    {required String massege, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 500),
      backgroundColor: color,
      content: Text(massege),
    ),
  );
}
