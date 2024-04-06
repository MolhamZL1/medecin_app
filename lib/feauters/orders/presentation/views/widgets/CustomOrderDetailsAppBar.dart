import 'package:flutter/material.dart';

class CustomOrderDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomOrderDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "My Order",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
