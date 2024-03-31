import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/models/medicine_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.medicine,
    //required this.isfavourite
  });
  final MedicineModel medicine;
  // final bool isfavourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, ProductPage.id,
        //     arguments: widget.medicine);
      },
      child: Card(
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
                  // if (isfavourite) {
                  //   // AddFavouriteService().addFavouriteService({
                  //   //   "id": widget.medicine.id,
                  //   //   "token": token,
                  //   // });
                  //   // widget.isfavourite = false;
                  // } else {
                  //   // AddFavouriteService().addFavouriteService({
                  //   //   "id": widget.medicine.id,
                  //   //   "token": token,
                  //   // });
                  //   // widget.isfavourite = true;
                  // }
                },
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
              CustomTextCard(text: "Name: ${medicine.scientificName}"),
              CustomTextCard(text: "Factory: ${medicine.manufacturer}"),
              CustomTextCard(text: "Price: " r"$" "${medicine.price}"),
              Container(
                width: double.infinity,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextCard extends StatelessWidget {
  const CustomTextCard({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
