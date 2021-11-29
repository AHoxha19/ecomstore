import 'dart:async';

import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PaymentState {
  waiting,
  loading,
  done,
}

class PaymentDialog extends StatefulWidget {
  const PaymentDialog(
      {Key? key,
      required this.content,
      required this.total,
      required this.onPay})
      : super(key: key);

  final Widget content;
  final double total;
  final Function onPay;

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  late Timer _timer;
  late Widget contentToShow;
  PaymentState paymentState = PaymentState.waiting;

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

  Widget buildSuccessPayment(width, height) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
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

  void startTimer(width, height) {
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        contentToShow = buildSuccessPayment(width, height);
        widget.onPay();
        paymentState = PaymentState.done;
      });
      //Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
        title: const Text("Confirmation"),
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
                Text("Total: ${widget.total}"),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kLogoColor)),
                    onPressed: () {
                      setState(() {
                        contentToShow =
                            buildLoadingPayment(width * 0.1, height * 0.2);
                        paymentState = PaymentState.loading;
                      });
                      startTimer(width * 0.1, height * 0.2);
                    },
                    child: const Text(
                      "Pay",
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
