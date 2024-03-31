import 'package:flutter/material.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/add_to_cart_section.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/information_medecine_section.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/name_And_price_section.dart';

class MedecineDetailsViewBody extends StatelessWidget {
  const MedecineDetailsViewBody({super.key, required this.medecine});
  final MedicineModel medecine;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 20),
        Image.asset("assets/images/medicine.png"),
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: double.infinity,
          decoration: shadowContainer(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NameAndPriceSection(medecine: medecine),
                Expanded(child: InformationMedecineSection(medecine: medecine)),
                AddToCartSection(medecine: medecine)
              ],
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration shadowContainer() {
    return BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              blurRadius: 40,
              spreadRadius: 20,
              offset: const Offset(10, 10)),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(55), topRight: Radius.circular(55)));
  }
}
