import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/custom_medecine_details_text.dart';

class InformationMedecineSection extends StatelessWidget {
  const InformationMedecineSection({
    super.key,
    required this.medecine,
  });

  final MedicineModel medecine;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormatter.formatDateTime(
      dateTime: medecine.expiryDate,
      outputFormat: 'dd/MM/yyyy',
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomMedecineDetailsText(text: "Category: ${medecine.category}"),
        CustomMedecineDetailsText(text: "Factory: ${medecine.manufacturer}"),
        CustomMedecineDetailsText(
          text: "EXP: $formattedDate",
        ),
      ],
    );
  }
}
