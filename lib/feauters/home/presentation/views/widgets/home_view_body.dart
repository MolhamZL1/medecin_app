import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/widgets/custom_circle_loading.dart';
import 'package:rosemary/feauters/home/presentation/view_models/categoriesCubit/categories_cubit.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/customCategoryCard.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
      if (state is CategoriesFailure) {
        customshowSnackBar(context,
            massege: state.errMessage, color: Colors.redAccent);
      }
    }, builder: (context, state) {
      if (state is CategoriesSuccess) {
        List<dynamic> categories = state.categories;
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
      } else {
        return const CustomCircleLoading();
      }
    });
  }
}
