import 'package:flutter/material.dart';

void showSnackbarError(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ),
  );
}

void showSnackbarSuccess(BuildContext context, String success) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(success),
      backgroundColor: Color(0xFF4caf50),
    ),
  );
}
