import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/images/images.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        margin: const EdgeInsets.only(bottom: 0),
        decoration: BoxDecoration(gradient: backgroundColor()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage(kLogoImage)),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Name",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ));
  }
}
