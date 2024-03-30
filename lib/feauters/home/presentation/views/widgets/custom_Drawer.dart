import 'package:flutter/material.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_drawer_heaeder.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_language_list_tile.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_logout_listtile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          CustomDrawerHeader(),
          CustomLanguageListTile(),
          CustomLogoutListTile(),
        ],
      ),
    );
  }
}
