import 'package:flutter/material.dart';
import 'package:rosemary/feauters/orders/data/models/OrderModel.dart';

class TitleAndOrderNumberRow extends StatelessWidget {
  const TitleAndOrderNumberRow({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Medecines",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text("# ${order.ordernumber}",
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
