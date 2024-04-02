import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/feauters/search/presentation/view_models/searchCubit/search_cubit.dart';

class CustomPopUpButton extends StatefulWidget {
  const CustomPopUpButton({super.key});

  @override
  State<CustomPopUpButton> createState() => _CustomPopUpButtonState();
}

class _CustomPopUpButtonState extends State<CustomPopUpButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      icon: const Icon(Icons.tune),
      itemBuilder: (context) => const [
        PopupMenuItem<String>(value: "Medecine", child: Text("Medecine")),
        PopupMenuItem(value: "Category", child: Text("Category"))
      ],
      onSelected: (String value) => setState(
          () => BlocProvider.of<SearchCubit>(context).popUpValue = value),
    );
  }
}
