import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/providers/auth_provider.dart';
import 'package:ecomstore/utils/show_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final user = Provider.of<User?>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: height * 0.1,
            backgroundColor: kLogoColor,
            child: Text("${user!.email}"),
          ),
          ElevatedButton(
              onPressed: () async {
                //logout
                await authProvider.signOut();
                showSnackbarSuccess(context, "Logged out successfully!");
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).errorColor)),
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
