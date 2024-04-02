import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/functions/buildOutLinedBorder.dart';
import 'package:rosemary/feauters/search/presentation/view_models/searchCubit/search_cubit.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 0, bottom: 4),
        child: Form(
          key: formkey,
          child: TextFormField(
            cursorColor: kColor,
            validator: (data) {
              if (data!.isEmpty) {
                return "Enter medecine name or category";
              }
              return null;
            },
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: onPressed, icon: const Icon(Icons.search)),
              hintText: "Search",
              hintStyle: TextStyle(
                color: kColor.withOpacity(.7),
                fontSize: 18,
              ),
              focusedBorder: buildOutlinedBorder(),
              enabledBorder: buildOutlinedBorder(),
              border: buildOutlinedBorder(),
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    if (formkey.currentState!.validate()) {
      if (BlocProvider.of<SearchCubit>(context).popUpValue == "Category") {
        BlocProvider.of<SearchCubit>(context)
            .searchByCategory(searchingInput: controller.text);
      } else {
        BlocProvider.of<SearchCubit>(context)
            .searchByMedecine(searchingInput: controller.text);
      }
    }
  }
}
