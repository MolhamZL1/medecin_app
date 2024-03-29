import 'package:flutter/material.dart';

void customshowSnackBar(BuildContext context,
    {required String massege, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(massege),
    ),
  );
}
