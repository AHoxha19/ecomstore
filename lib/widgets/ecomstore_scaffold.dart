import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/material.dart';

class EcomstoreScaffold extends StatelessWidget {
  const EcomstoreScaffold(
      {Key? key,
      required Widget body,
      BottomNavigationBar? bottomNavigationBar})
      : _body = body,
        _bottomNavigationBar = bottomNavigationBar,
        super(key: key);

  final Widget _body;
  //We won't use the bottomNavigationBar in productDetail
  final BottomNavigationBar? _bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "Ecom",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "store",
                style: TextStyle(color: kLogoColor),
              )
            ]),
          )),
      body: _body,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
