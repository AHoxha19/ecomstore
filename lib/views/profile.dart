import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/providers/auth_provider.dart';
import 'package:ecomstore/utils/show_state.dart';
import 'package:ecomstore/widgets/profile_menu.dart';
import 'package:ecomstore/widgets/profile_pic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  XFile? pickedImage;
  User? user;

  void editProfileImage() async {
    try {
      pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      print(pickedImage!.name);
      print(pickedImage!.path);

      //now upload to Firebase
      if (pickedImage != null) {
        await user!.updatePhotoURL(pickedImage!.path);
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    user = Provider.of<User?>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    print(user!.photoURL);

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          ProfilePic(
            onImageEdit: editProfileImage,
            imagePath: pickedImage == null ? user?.photoURL : pickedImage?.path,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          ProfileMenu(
              text:
                  "${user!.displayName ?? "DisplayName is not set, click to edit..."}",
              icon: CupertinoIcons.profile_circled),
          SizedBox(
            height: height * 0.02,
          ),
          ProfileMenu(text: "${user!.email}", icon: CupertinoIcons.mail),
          SizedBox(
            height: height * 0.05,
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
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
