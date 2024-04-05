import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/widgets/custom_circle_loading.dart';
import 'package:rosemary/feauters/cart/presentation/view_models/Cart_cubit/cart_cubit.dart';
import 'package:rosemary/feauters/cart/presentation/views/widgets/customBuyCartButton.dart';
import 'package:rosemary/feauters/medicines/presentation/views/widgets/customMedecinesGridViewBuilder.dart';

import 'CustomcartGridViewBuilder.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          customshowSnackBar(context,
              massege: state.errMessage, color: Colors.redAccent);
        }
      },
      builder: (context, state) {
        if (state is CartSuccess) {
          return state.medecines.isEmpty
              ? Center(child: Image.asset("assets/images/empty_cart.png"))
              : Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: CustomCartGridViewBuilder(
                          medicines: state.medecines,
                          physics: const BouncingScrollPhysics()),
                    ),
                    const CustomBuyCartButton()
                  ],
                );
        } else {
          return const CustomCircleLoading();
        }
      },
    );
  }
}
