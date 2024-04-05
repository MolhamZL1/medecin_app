import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/utils/go_route.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        GoRouter.of(context).push(Routes.kMedecinesView, extra: category);
      },
      child: Card(
          shadowColor: Colors.grey.withOpacity(.9),
          elevation: 20,
          color: kColor,
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
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width / 35),
                child: Text(
                  category,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 25),
                ),
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
