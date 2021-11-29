import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Modified version of: https://github.com/abuanwar072/E-commerce-Complete-Flutter-UI/blob/master/lib/screens/profile/components/profile_pic.dart

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    this.imagePath,
    required this.onImageEdit,
  }) : super(key: key);

  final defaultImagePathUrl = "images/ecomstore_logo_without_text.png";

  final String? imagePath;
  final VoidCallback onImageEdit;

  Widget buildProfilePic() {
    return CircleAvatar(
        backgroundColor: kLogoColor,
        child: imagePath == null
            ? CircleAvatar(
                radius: 55, backgroundImage: AssetImage(defaultImagePathUrl))
            : CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(imagePath!),
              ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          buildProfilePic(),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    )),
                    backgroundColor: MaterialStateProperty.all(colorLogo[200]),
                    overlayColor: MaterialStateProperty.all(colorLogo[500])),
                onPressed: () => onImageEdit(),
                child: const Icon(CupertinoIcons.pencil),
              ),
            ),
          )
        ],
      ),
    );
  }
}
