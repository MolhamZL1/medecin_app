import 'package:flutter/material.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/custom_price_container.dart';

class NameAndPriceSection extends StatelessWidget {
  const NameAndPriceSection({
    super.key,
    required this.medecine,
  });

  final MedicineModel medecine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          medecine.scientificName,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        CustomPriceContainer(medecine: medecine)
      ],
    );
  }
}
