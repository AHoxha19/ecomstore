import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/services/auth_service.dart';
import 'package:ecomstore/utils/show_state.dart';
import 'package:ecomstore/views/sign_up.dart';
import 'package:ecomstore/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);
  static const routeName = '/signIn';
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _authProvider = AuthService.instance;

  void signInUser(email, password) async {
    final authValue =
        await _authProvider.signIn(email: email, password: password);
    if (authValue != AuthService.authOperationSuccessful) {
      showSnackbarError(context, authValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Image(
                image: const AssetImage(
                  "images/ecomstore_logo_x400.png",
                ),
                height: height * 0.3,
                width: height * 0.3,
              ),
              Text(
                "Sign In",
                style: TextStyle(color: Colors.black, fontSize: height * 0.03),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              LoginForm(
                onValidated: (email, password) async =>
                    signInUser(email, password),
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SignUpView.routeName),
                  child: const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "No account ? Sign up ",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    TextSpan(
                      text: "here",
                      style: TextStyle(color: kLogoColor),
                    ),
                  ]))),
            ],
          ),
        ),
      ),
    );
  }
}
