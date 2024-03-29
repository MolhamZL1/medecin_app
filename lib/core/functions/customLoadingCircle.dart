import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

void customshowLoadingCircle(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: CircularProgressIndicator(
          color: kColor,
        ));
      });
}
