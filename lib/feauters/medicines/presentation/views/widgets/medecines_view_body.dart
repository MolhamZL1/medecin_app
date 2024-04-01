import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/core/widgets/custom_circle_loading.dart';
import 'package:rosemary/feauters/medicines/presentation/view_models/medecinesByCategoryCubit/medecines_by_category_cubit.dart';
import 'package:rosemary/feauters/medicines/presentation/views/widgets/custom_medecine_card.dart';

class MedecinesViewBody extends StatelessWidget {
  const MedecinesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedecinesByCategoryCubit, MedecinesByCategoryState>(
      listener: (context, state) {
        if (state is MedecinesByCategoryFailure) {
          customshowSnackBar(context,
              massege: state.errMessage, color: Colors.redAccent);
        }
      },
      builder: (context, state) {
        if (state is MedecinesByCategorySuccess) {
          List<MedicineModel> medicines = state.medecines;
          return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              itemCount: medicines.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return CustomMedecineCard(
                  medicine: medicines[index],
                  //  isfavourite: false,
                );
              });
        } else {
          return const CustomCircleLoading();
        }
      },
    );
  }
}
