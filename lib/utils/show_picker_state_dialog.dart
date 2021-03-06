import 'package:flutter/material.dart';

Widget pickerErrorDialog(BuildContext context, String error) {
  return AlertDialog(
    title: const Text("Error"),
    content: const Text(
      "You must add the permission to access the gallery!  (info.plist or manifest.xml)",
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"))
    ],
  );
}
