import 'package:flutter/material.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/medecine_details_view_body.dart';

class MedecineDetailsView extends StatelessWidget {
  const MedecineDetailsView({super.key, required this.medecine});
  final MedicineModel medecine;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: medecine.tradeName),
      body: MedecineDetailsViewBody(
        medecine: medecine,
      ),
    );
  }
}
