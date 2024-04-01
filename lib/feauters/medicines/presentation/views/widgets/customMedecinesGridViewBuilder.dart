import 'package:flutter/material.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicines/presentation/views/widgets/custom_medecine_card.dart';

class CustomMedecinesGridViewBuilder extends StatelessWidget {
  const CustomMedecinesGridViewBuilder({
    super.key,
    required this.medicines,
  });

  final List<MedicineModel> medicines;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: medicines.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return CustomMedecineCard(
            medicine: medicines[index],
            //  isfavourite: false,
          );
        });
  }
}