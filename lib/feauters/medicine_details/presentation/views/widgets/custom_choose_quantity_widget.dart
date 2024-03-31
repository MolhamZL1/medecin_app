import 'package:flutter/material.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/change_quantity_button.dart';

class CustomChooseQuantityWidget extends StatelessWidget {
  const CustomChooseQuantityWidget({
    super.key,
    required this.medecine,
  });

  final MedicineModel medecine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(55)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChangeQuantityButton(
            icon: Icons.remove,
            onPressed: () {},
          ),
          Text(
            "0/${medecine.quantityAvailable}",
            style: const TextStyle(fontSize: 18),
          ),
          ChangeQuantityButton(
            icon: Icons.add,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
