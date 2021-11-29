import 'package:flutter/material.dart';

class FirebaseInitializationError extends StatelessWidget {
  const FirebaseInitializationError({Key? key, this.error}) : super(key: key);

  final Object? error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
              child: Text(
            "Error when initializing Firebase SDK:\n$error}",
            style: const TextStyle(fontSize: 20),
          )),
        ),
      ),
    );
  }
}
