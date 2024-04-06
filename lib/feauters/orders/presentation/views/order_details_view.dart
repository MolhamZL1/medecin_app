import 'package:flutter/material.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/CustomOrderDetailsAppBar.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/OrderDetailsViewBody.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomOrderDetailsAppBar(),
      body: OrderDetailsViewBody(),
    );
  }
}
