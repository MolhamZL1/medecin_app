import 'package:flutter/material.dart';
import 'package:rosemary/feauters/orders/data/models/OrderModel.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/two_text_in_colmun.dart';

class StatueAndQuantityColmun extends StatelessWidget {
  const StatueAndQuantityColmun({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TwoTextINColumn(title: "Statue", info: order.status),
        const SizedBox(
          height: 16,
        ),
        TwoTextINColumn(title: "Quantity", info: order.totalQuantity),
      ],
    );
  }
}
