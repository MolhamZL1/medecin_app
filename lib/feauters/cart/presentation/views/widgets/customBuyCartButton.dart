import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/feauters/cart/presentation/view_models/Buy_Cart/buy_cart_cubit.dart';
import 'package:rosemary/feauters/cart/presentation/view_models/Cart_cubit/cart_cubit.dart';

class CustomBuyCartButton extends StatefulWidget {
  const CustomBuyCartButton({super.key});

  @override
  State<CustomBuyCartButton> createState() => _CustomBuyCartButtonState();
}

class _CustomBuyCartButtonState extends State<CustomBuyCartButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuyCartCubit, BuyCartState>(
      listener: (context, state) {
        if (state is BuyCartFailure) {
          customshowSnackBar(context,
              massege: state.errMessage, color: Colors.red);
        } else if (state is BuyCartSuccess) {
          BlocProvider.of<CartCubit>(context).fetchCart();
        }
      },
      builder: (context, state) {
        if (state is BuyCartLoading) {
          isLoading = true;
        }
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Buy Cart"),
                        content: const Text("Total Price:"),
                        actions: [
                          TextButton(
                            child: const Text(
                              "Close",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text("Buy", style: TextStyle(color: kColor)),
                            onPressed: () {
                              BlocProvider.of<BuyCartCubit>(this.context)
                                  .buyCart();
                              GoRouter.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: buildDecorationContainer(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white),
                  height: 60,
                  child: Center(
                    child: isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : Text(
                            "Buy",
                            style: TextStyle(fontSize: 20, color: kColor),
                          ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  BoxDecoration buildDecorationContainer() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: 5,
        blurRadius: 10,
        offset: const Offset(0, 10),
      ),
    ], borderRadius: BorderRadius.circular(24), gradient: backgroundColor());
  }
}
