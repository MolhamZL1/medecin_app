import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

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
            icon: Icon(isObsecure == false
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash)),
        hintText: "Password",
        hintStyle: const TextStyle(
          color: Color.fromARGB(172, 58, 176, 184),
          fontSize: 18,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF3AAFB8),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
