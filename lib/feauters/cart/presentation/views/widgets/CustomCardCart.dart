import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/cart/presentation/view_models/Cart_cubit/cart_cubit.dart';
import 'package:rosemary/feauters/medicines/presentation/views/widgets/customCartTextField.dart';

class CustomCardCart extends StatelessWidget {
  const CustomCardCart({
    super.key,
    required this.medicine,
  });
  final MedicineModel medicine;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.withOpacity(.9),
      elevation: 20,
      color: kColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<CartCubit>(context)
                    .removeFromCart(id: medicine.id);
              },
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            CustomTextCard(text: "Name: ${medicine.scientificName}"),
            CustomTextCard(text: "Factory: ${medicine.manufacturer}"),
            CustomTextCard(text: "Price: " r"$" "${medicine.price}"),
            CustomTextCard(text: "Quantity: ${medicine.quantityAvailable}"),
            Container(
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
