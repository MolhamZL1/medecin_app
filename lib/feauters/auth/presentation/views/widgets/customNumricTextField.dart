import 'package:flutter/material.dart';

class CustomNumericTextField extends StatelessWidget {
  const CustomNumericTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "Enter The Phone Number";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: const InputDecoration(
        hintText: "Phone Number",
        hintStyle: TextStyle(
          color: Color.fromARGB(172, 58, 176, 184),
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF3AAFB8),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
