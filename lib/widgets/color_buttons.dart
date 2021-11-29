import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/material.dart';

class ColorButtons extends StatefulWidget {
  const ColorButtons({Key? key}) : super(key: key);

  @override
  State<ColorButtons> createState() => _ColorButtonsState();
}

class _ColorButtonsState extends State<ColorButtons> {
  List<bool> isSelected = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Color",
          style: TextStyle(fontSize: height * 0.025),
        ),
        ToggleButtons(
          children: [
            Container(
              decoration: isSelected[0]
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kFirstShopItemColor,
                      ),
                    )
                  : null,
              child: isSelected[0]
                  ? const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: kFirstShopItemColor,
                      ),
                    )
                  : const CircleAvatar(
                      backgroundColor: kFirstShopItemColor,
                      foregroundColor: Colors.white,
                    ),
            ),
            Container(
              decoration: isSelected[1]
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kSecondShopItemColor,
                      ),
                    )
                  : null,
              child: isSelected[1]
                  ? const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: kSecondShopItemColor,
                      ),
                    )
                  : const CircleAvatar(
                      backgroundColor: kSecondShopItemColor,
                    ),
            ),
            Container(
              decoration: isSelected[2]
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kThirdShopItemColor),
                    )
                  : null,
              child: isSelected[2]
                  ? const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: kThirdShopItemColor,
                      ),
                    )
                  : const CircleAvatar(
                      backgroundColor: kThirdShopItemColor,
                    ),
            ),
            Container(
              decoration: isSelected[3]
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kFourthShopItemColor),
                    )
                  : null,
              child: isSelected[3]
                  ? const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: kFourthShopItemColor,
                      ),
                    )
                  : const CircleAvatar(
                      backgroundColor: kFourthShopItemColor,
                    ),
            ),
          ],
          renderBorder: false,
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelected.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            });
          },
        ),
      ],
    );
  }
}
