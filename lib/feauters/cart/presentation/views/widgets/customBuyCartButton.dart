import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomBuyCartButton extends StatelessWidget {
  const CustomBuyCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: buildDecorationContainer(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: Colors.white),
              height: 60,
              child: Center(
                child: Text(
                  "Buy",
                  style: TextStyle(fontSize: 20, color: kColor),
                ),
              ),
            ),
          ),
        ));
  }

  BoxDecoration buildDecorationContainer() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: 5,
        blurRadius: 10,
        offset: const Offset(0, 10),
      ),
    ], borderRadius: BorderRadius.circular(24), gradient: backgroundColor());
  }
}
