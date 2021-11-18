import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({
    Key? key,
    String? imagePath,
    required this.onImageEdit,
  }) : super(key: key) {
    print("constructor");
    if (imagePath != null) {
      this.imagePath = imagePath;
    } else {
      this.imagePath = "images/profile-placeholder.png";
    }
  }

  late final String imagePath;
  final VoidCallback onImageEdit;

  Widget buildProfilePic() {
    return CircleAvatar(
      backgroundColor: kLogoColor,
      child: CircleAvatar(
        radius: 55,
        backgroundImage: AssetImage(imagePath),
      ),
    );
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
                      side: BorderSide(color: Colors.white),
                    )),
                    backgroundColor: MaterialStateProperty.all(colorLogo[200]),
                    overlayColor: MaterialStateProperty.all(colorLogo[500])),
                onPressed: () => onImageEdit(),
                child: Icon(CupertinoIcons.pencil),
              ),
            ),
          )
        ],
      ),
    );
  }
}
