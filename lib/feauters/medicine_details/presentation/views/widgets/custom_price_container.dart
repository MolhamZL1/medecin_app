import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/models/medicine_model.dart';

class CustomPriceContainer extends StatelessWidget {
  const CustomPriceContainer({
    super.key,
    required this.medecine,
  });

  final MedicineModel medecine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: kColor, borderRadius: BorderRadius.circular(20)),
      height: 60,
      width: 100,
      child: Center(
          child: Text(
        r"$" "${medecine.price}",
        style: const TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
