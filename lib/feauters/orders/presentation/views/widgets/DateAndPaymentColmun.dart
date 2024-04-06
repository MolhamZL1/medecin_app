import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:rosemary/feauters/orders/data/models/OrderModel.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/two_text_in_colmun.dart';

class DateAndPaymentColmun extends StatelessWidget {
  const DateAndPaymentColmun({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TwoTextINColumn(
            title: "Date",
            info: DateFormatter.formatDateTime(
                dateTime: order.date, outputFormat: "dd/MM/yyyy")),
        const SizedBox(
          height: 16,
        ),
        TwoTextINColumn(
            title: "Payment",
            info: "${order.totalPrice}" r"$" "    State: ${order.paid}"),
      ],
    );
  }
}
