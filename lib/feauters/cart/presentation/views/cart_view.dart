import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/feauters/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kColor,
        ),
        body: const CartViewBody());
  }
}
