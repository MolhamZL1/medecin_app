import 'package:flutter/material.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/custom_devider.dart';

class DevidersSection extends StatelessWidget {
  const DevidersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomDevider(),
        SizedBox(
          height: 16,
        ),
        CustomDevider()
      ],
    );
  }
}
