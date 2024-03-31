import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';

class CustomCircleLoading extends StatelessWidget {
  const CustomCircleLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: kColor,
    ));
  }
}
