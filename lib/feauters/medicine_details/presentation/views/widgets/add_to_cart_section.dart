import 'package:flutter/material.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/custom_choose_quantity_widget.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/custom_elevated_button.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({
    super.key,
    required this.medecine,
  });

  final MedicineModel medecine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomChooseQuantityWidget(medecine: medecine),
        CustomElevatedButton(medicineModel: medecine)
      ],
    );
  }
}
