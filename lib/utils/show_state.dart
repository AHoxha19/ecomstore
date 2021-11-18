import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/material.dart';

void showSnackbarError(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error),
      backgroundColor: kErrorColor,
    ),
  );
}

void showSnackbarSuccess(BuildContext context, String success) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(success),
      backgroundColor: kSuccessColor,
    ),
  );
}
