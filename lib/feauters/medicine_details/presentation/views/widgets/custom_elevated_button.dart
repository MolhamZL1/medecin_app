import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          // if (_quantity != 0) {
          //   try {
          //     await AddToCartService().addToCartService({
          //       "id": medicin.id,
          //       "quantity": _quantity.toString(),
          //       "token": token
          //     });

          //       showSnackBar(context,
          //           massege: S.of(context).added,
          //           color: Colors.green);
          //       _quantity = 0;
          //       setState(() {});
          //     } on Exception catch (e) {
          //       showSnackBar(context,
          //           massege: S.of(context).Not_available,
          //           color: Colors.red);
          //     }
          //   } else
          //     showSnackBar(context,
          //         massege: S.of(context).Insert_Quantity,
          //         color: Colors.red);
        },
        child: const Text(
          "Add To Cart",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ));
  }
}
