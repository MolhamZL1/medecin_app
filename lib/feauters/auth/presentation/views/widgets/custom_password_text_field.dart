import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/functions/buildOutLinedBorder.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kColor,
      validator: (data) {
        if (data!.isEmpty) {
          return "Enter The Password";
        }
        return null;
      },
      obscureText: isObsecure,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            onPressed: () {
              isObsecure = isObsecure == true ? false : true;
              setState(() {});
            },
            icon: Icon(
              isObsecure == false
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              color: kColor,
            )),
        hintText: "Password",
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
