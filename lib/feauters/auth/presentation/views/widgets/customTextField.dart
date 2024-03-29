import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/functions/buildOutLinedBorder.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kColor,
      validator: (data) {
        if (data!.isEmpty) {
          return "Enter The your name";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: "User Name",
        hintStyle: TextStyle(
          color: kColor.withOpacity(.7),
          fontSize: 18,
        ),
        focusedBorder: buildOutlinedBorder(),
        enabledBorder: buildOutlinedBorder(),
        border: buildOutlinedBorder(),
      ),
    );
  }
}
