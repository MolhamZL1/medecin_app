import 'package:flutter/material.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/customCategoryCard.dart';

class CustomCategoriesGridViewBuilder extends StatelessWidget {
  const CustomCategoriesGridViewBuilder({
    super.key,
    required this.categories,
  });

  final List categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return CustomCategoryCard(
            category: categories[index],
          );
        });
  }
}
