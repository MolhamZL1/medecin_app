import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/core/widgets/custom_circle_loading.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/customCategoriesGridViewBuilder.dart';
import 'package:rosemary/feauters/medicines/presentation/views/widgets/customMedecinesGridViewBuilder.dart';
import 'package:rosemary/feauters/search/presentation/view_models/searchCubit/search_cubit.dart';

class CustomsearchGridViewBuilder extends StatelessWidget {
  const CustomsearchGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchFailure) {
          customshowSnackBar(context,
              massege: state.errMessage, color: Colors.redAccent);
        }
      },
      builder: (context, state) {
        if (state is SearchLoading) {
          return const CustomCircleLoading();
        } else if (state is SearchMedecinesSuccess) {
          List<MedicineModel> medicines = state.medicines;
          if (medicines.isEmpty) {
            return Image.asset("assets/images/Empty.png");
          }
          return CustomMedecinesGridViewBuilder(
            medicines: medicines,
            physics: const NeverScrollableScrollPhysics(),
          );
        } else if (state is SearchCategoriesSuccess) {
          List<dynamic> categories = state.categories;
          if (categories.isEmpty) {
            return Image.asset("assets/images/Empty.png");
          }
          return CustomCategoriesGridViewBuilder(
            categories: categories,
            physics: const NeverScrollableScrollPhysics(),
          );
        } else {
          return Center(child: Image.asset("assets/images/search.png"));
        }
      },
    );
  }
}
