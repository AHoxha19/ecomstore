import 'dart:io';

import 'package:ecomstore/providers/auth_provider.dart';
import 'package:ecomstore/utils/show_state.dart';
import 'package:ecomstore/views/sign_in.dart';
import 'package:ecomstore/widgets/profile_info.dart';
import 'package:ecomstore/widgets/profile_pic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  XFile? pickedImage;
  User? user;

  Future<String> uploadFileToFirebaseStorageAndGetUrl(String filePath) async {
    File file = File(filePath);
    firebase_storage.Reference fileRef =
        firebase_storage.FirebaseStorage.instance.ref("user_image");

    try {
      final taskSnapshot = await fileRef.putFile(file);
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      //could not upload image;
      rethrow;
    }
  }

  void editProfileImage() async {
    try {
      pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      //now upload to Firebase
      if (pickedImage != null) {
        //first update to storage and get URL
        final downloadUrl =
            await uploadFileToFirebaseStorageAndGetUrl(pickedImage!.path);
        //then update imageUrl of user
        await user!.updatePhotoURL(downloadUrl);
      }
      setState(() {});
    } catch (e) {
      showSnackbarError(context, e.toString());
    }
  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    user = Provider.of<User?>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          ProfilePic(
            onImageEdit: editProfileImage,
            imagePath: user?.photoURL,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          ProfileInfo(
              text: user!.displayName ??
                  "DisplayName is not set, click to edit...",
              icon: CupertinoIcons.profile_circled,
              type: ProfileInfoType.displayName,
              onSubmitted: (value) async {
                try {
                  await user!.updateDisplayName(value);
                  showSnackbarSuccess(
                      context, "DisplayName changed successfully!");
                } catch (e) {
                  showSnackbarError(context, "An error occured");
                }
              }),
          SizedBox(
            height: height * 0.02,
          ),
          ProfileInfo(
            text: "${user!.email}",
            icon: CupertinoIcons.mail,
            type: ProfileInfoType.email,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          ElevatedButton(
              onPressed: () async {
                //logout
                final authOperationMessage = await authProvider.signOut();
                if (authOperationMessage ==
                    AuthProvider.authOperationSuccessful) {
                  showSnackbarSuccess(context, "Logged out successfully!");
                } else {
                  showSnackbarError(context, authOperationMessage);
                }
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
