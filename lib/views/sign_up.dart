import 'package:ecomstore/services/auth_service.dart';
import 'package:ecomstore/utils/show_state.dart';
import 'package:ecomstore/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  static const routeName = '/signUp';

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _authProvider = AuthService.instance;

  void signUpUser(email, password) async {
    final authValue =
        await _authProvider.signUp(email: email, password: password);
    if (authValue == AuthService.authOperationSuccessful) {
      Navigator.pop(context);
      showSnackbarSuccess(context, "Sign Up successful, welcome to Ecomstore!");
    } else {
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
                "Sign Up",
                style: TextStyle(color: Colors.black, fontSize: height * 0.03),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              LoginForm(
                onValidated: (email, password) async =>
                    signUpUser(email, password),
              )
            ],
          ),
        ),
      ),
    );
  }
}
