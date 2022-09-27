import 'dart:async';

import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/show_state.dart';

enum PaymentState {
  waiting,
  loading,
  done,
}

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key, required this.content, required this.onAdd})
      : super(key: key);

  final Widget content;
  final Future<void> Function() onAdd;

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  late Widget contentToShow;
  PaymentState paymentState = PaymentState.waiting;
  String errorMessage = "";
  bool hasError = false;

  Widget buildLoadingPayment(width, height) {
    return SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: CircularProgressIndicator(
            color: kLogoColor,
          ),
        ));
  }

  Widget buildPayment(width, height) {
    return SizedBox(
      width: width,
      height: height,
      child: hasError
          ? Column(
              children: [
                Icon(
                  Icons.error,
                  size: 100,
                  color: kErrorColor,
                ),
                Text("Transaction failed. Error: $errorMessage"),
              ],
            )
          : Column(
              children: const [
                Icon(
                  Icons.done,
                  size: 100,
                  color: kSuccessColor,
                ),
                Text("Thanks for your order !"),
              ],
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    contentToShow = widget.content;
  }

  void startTimer(width, height) {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
        title: const Text("Add new item"),
        content: contentToShow,
        actions: paymentState == PaymentState.done ||
                paymentState == PaymentState.loading
            ? [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(colorLogo[300])),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                    )),
              ]
            : [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kLogoColor)),
                    onPressed: () {
                      widget.onAdd().then((value) {
                        showSnackbarSuccess(
                            context, "ShopItem added successfully!");
                        Navigator.pop(context);
                      }).catchError((error) {
                        showSnackbarError(
                            context, "Could not add shopItem: $error");
                      });
                      //
                    },
                    child: const Text(
                      "Add",
                    )),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(colorLogo[300])),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                    ))
              ]);
  }
}
