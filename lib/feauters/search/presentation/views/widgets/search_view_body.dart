import 'package:flutter/material.dart';
import 'package:rosemary/feauters/search/presentation/views/widgets/custom_popup_button.dart';
import 'package:rosemary/feauters/search/presentation/views/widgets/custom_search_grid_view_builder.dart';
import 'package:rosemary/feauters/search/presentation/views/widgets/custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: const [
        Row(
          children: [
            CustomPopUpButton(),
            CustomSearchTextField(),
          ],
        ),
        CustomsearchGridViewBuilder()
      ],
    );
  }
}
