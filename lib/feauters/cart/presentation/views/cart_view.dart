import 'package:flutter/material.dart';
import 'package:rosemary/feauters/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:rosemary/feauters/cart/presentation/views/widgets/custom_cart_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomCartAppBar(), body: CartViewBody());
  }
}
