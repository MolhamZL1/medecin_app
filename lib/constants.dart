import 'package:flutter/material.dart';

Color kColor = const Color(0xFF3AAFB8);

LinearGradient backgroundColor() {
  return const LinearGradient(
    colors: [
      Color(0xFF0F919E),
      Color(0xFF3AAFB8),
      Color(0xFF63CAD1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
