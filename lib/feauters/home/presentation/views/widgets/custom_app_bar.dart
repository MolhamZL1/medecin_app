import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.currentIndex});
  final int currentIndex;
  String getTitle() {
    if (currentIndex == 0) {
      return "Home";
    } else if (currentIndex == 1) {
      return "Orders";
    } else if (currentIndex == 2) {
      return "Favourite";
    } else {
      return "Notifications";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(getTitle()),
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
