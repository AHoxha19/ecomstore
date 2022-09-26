import 'dart:io';

import 'package:ecomstore/api/auth_service.dart';
import 'package:ecomstore/api/ecomstore_api.dart';
import 'package:ecomstore/providers/settings_provider.dart';
import 'package:ecomstore/utils/show_state.dart';
import 'package:ecomstore/views/sign_in.dart';
import 'package:ecomstore/widgets/profile_info.dart';
import 'package:ecomstore/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //user = Provider.of<User?>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          ProfileInfo(
              text: EcomstoreApi.instance.ecomstoreServerUrl,
              icon: CupertinoIcons.settings,
              type: ProfileInfoType.displayName,
              onSubmitted: (value) async {
                try {
                  settingsProvider.changeServerUrl(value);
                  showSnackbarSuccess(
                      context, "ServerUrl changed successfully!");
                } catch (e) {
                  showSnackbarError(context, "An error occured");
                }
              }),
          SizedBox(
            height: height * 0.05,
          ),
        ],
      ),
    );
  }
}
