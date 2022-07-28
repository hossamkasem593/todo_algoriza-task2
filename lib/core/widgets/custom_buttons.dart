// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'constants.dart';

Widget CustomButtom({
  @required String? text,
  @required VoidCallback? onPressed,
  bool isUpper = false,
  double radius = 10,
  double width = double.infinity,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: KmainColor,
    ),
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        isUpper ? text!.toUpperCase() : text!,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
