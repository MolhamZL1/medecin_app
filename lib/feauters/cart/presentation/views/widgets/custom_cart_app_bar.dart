import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Cart",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: kColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
