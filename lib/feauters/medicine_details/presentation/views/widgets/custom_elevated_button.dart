import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicine_details/presentation/view_models/AddToCartCubit/add_to_cart_cubit.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.medicineModel});
  final MedicineModel medicineModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          customshowSnackBar(context, massege: "Added", color: Colors.green);
        } else if (state is AddToCartFailure) {
          customshowSnackBar(context,
              massege: state.errMessage, color: Colors.redAccent);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                fixedSize: MaterialStateProperty.all(const Size(180, 60)),
                backgroundColor: MaterialStateProperty.all(kColor)),
            onPressed: () async {
              if (BlocProvider.of<AddToCartCubit>(context).quantity != 0) {
                BlocProvider.of<AddToCartCubit>(context)
                    .addToCart(medecineID: medicineModel.id);
              }
            },
            child: state == AddToCartLoading()
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : const Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ));
      },
    );
  }
}
