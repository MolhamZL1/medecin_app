import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicine_details/presentation/view_models/AddToCartCubit/add_to_cart_cubit.dart';
import 'package:rosemary/feauters/medicine_details/presentation/views/widgets/change_quantity_button.dart';

class CustomChooseQuantityWidget extends StatefulWidget {
  const CustomChooseQuantityWidget({super.key, required this.medecine});
  final MedicineModel medecine;

  @override
  State<CustomChooseQuantityWidget> createState() =>
      _CustomChooseQuantityWidgetState();
}

class _CustomChooseQuantityWidgetState
    extends State<CustomChooseQuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCartCubit, AddToCartState>(
        builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(55)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChangeQuantityButton(
              icon: Icons.remove,
              onPressed: () {
                if (BlocProvider.of<AddToCartCubit>(context).quantity > 0) {
                  setState(() =>
                      BlocProvider.of<AddToCartCubit>(context).quantity--);
                }
              },
            ),
            Text(
              "${BlocProvider.of<AddToCartCubit>(context).quantity}/${widget.medecine.quantityAvailable}",
              style: const TextStyle(fontSize: 18),
            ),
            ChangeQuantityButton(
              icon: Icons.add,
              onPressed: () {
                setState(
                    () => BlocProvider.of<AddToCartCubit>(context).quantity++);
              },
            )
          ],
        ),
      );
    });
  }
}
