import 'package:flutter/material.dart';
import 'package:rosemary/core/images/images.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        child: CircleAvatar(
          radius: 99,
          backgroundImage: AssetImage(
            kLogoImage,
          ),
        ),
      ),
    );
  }
}
