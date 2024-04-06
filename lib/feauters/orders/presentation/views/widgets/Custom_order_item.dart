import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/feauters/orders/data/models/OrderModel.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/DateAndPaymentColmun.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/StatueAndQuantityColmun.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/deviders-section.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/title_and_order_number_row.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
        decoration: orderItemDecoraation(),
        child: Column(
          children: [
            TitleAndOrderNumberRow(order: order),
            Row(
              children: [
                StatueAndQuantityColmun(order: order),
                const Spacer(),
                const DevidersSection(),
                DateAndPaymentColmun(order: order),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration orderItemDecoraation() {
    return BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: kColor, width: 2)),
        borderRadius: BorderRadius.circular(24));
  }
}
