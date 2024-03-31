import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Navigator.pushNamed(
        //   context,
        //   ProductsPage.id,
        //   arguments: category,
        // );
      },
      child: Card(
          shadowColor: Colors.grey.withOpacity(.9),
          elevation: 20,
          color: const Color(0xFF3AAFB8),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2 / 1.1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.asset(
                    getimage(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Text(
                category,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          )),
    );
  }

  getimage() {
    if (category == "Analgesic") {
      return "assets/images/Anti.jpg";
    } else if (category == "Antibiotic") {
      return "assets/images/R (2).jpg";
    } else if (category == "Anti-inflammatory") {
      return "assets/images/R (1).jpg";
    } else if (category == "Antipyretic") {
      return "assets/images/R.jpg";
    } else if (category == "Antihistamine") {
      return "assets/images/R (3).jpg";
    } else {
      return "assets/images/R (4).jpg";
    }
  }
}
