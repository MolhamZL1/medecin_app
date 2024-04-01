import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kColor,
      title: const Text(
        "Search",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
