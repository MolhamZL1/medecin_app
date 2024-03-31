import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/functions/customLoadingCircle.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/feauters/home/presentation/view_models/cubits/cubit/categories_cubit.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/customCategoryCard.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesLoading) {
          customshowLoadingCircle(context);
        } else if (state is CategoriesFailure) {
          customshowSnackBar(context,
              massege: state.errMessage, color: Colors.redAccent);
        } else if (state is CategoriesSuccess) {
          categories = state.categories;
        }
      },
      child: GridView.builder(
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
          }),
    );
  }
}
