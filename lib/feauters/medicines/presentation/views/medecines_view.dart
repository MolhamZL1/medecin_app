import 'package:flutter/material.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:rosemary/feauters/medicines/presentation/views/widgets/medecines_view_body.dart';

class MedecinesView extends StatelessWidget {
  const MedecinesView({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: category,
      ),
      body: const MedecinesViewBody(),
    );
  }
}
