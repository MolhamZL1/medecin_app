import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      flexibleSpace: Container(decoration: backgroundColor()),
      actions: [
        IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: () {
              // Navigator.pushNamed(context, SearchPage.id);
            },
            icon: const Icon(Icons.search)),
        IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: () {
              //     Navigator.pushNamed(context, CartPage.id);
            },
            icon: const Icon(FontAwesomeIcons.cartPlus))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
