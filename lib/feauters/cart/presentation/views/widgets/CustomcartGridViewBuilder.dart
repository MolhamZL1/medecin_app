import 'package:flutter/material.dart';
import 'package:rosemary/feauters/cart/presentation/views/widgets/CustomCardCart.dart';
import '../../../../../core/models/medicine_model.dart';

class CustomCartGridViewBuilder extends StatelessWidget {
  const CustomCartGridViewBuilder({
    super.key,
    required this.medicines,
    required this.physics,
  });

  final List<MedicineModel> medicines;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: physics,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: medicines.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return CustomCardCart(
            medicine: medicines[index],
          );
        });
  }
}
