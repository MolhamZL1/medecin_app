import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class ChangeQuantityButton extends StatelessWidget {
  const ChangeQuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: CircleAvatar(
        backgroundColor: kColor,
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          color: Colors.white,
        ),
      ),
    );
  }
}
