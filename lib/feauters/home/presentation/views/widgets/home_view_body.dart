import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/widgets/custom_circle_loading.dart';
import 'package:rosemary/feauters/home/presentation/view_models/categoriesCubit/categories_cubit.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/customCategoriesGridViewBuilder.dart';

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
        return CustomCategoriesGridViewBuilder(
          categories: categories,
          physics: const BouncingScrollPhysics(),
        );
      } else {
        return const CustomCircleLoading();
      }
    });
  }
}
