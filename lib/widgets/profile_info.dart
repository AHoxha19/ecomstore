import 'package:ecomstore/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// enum used to know the type of TextField
enum ProfileInfoType { displayName, email }

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({
    Key? key,
    required this.text,
    required this.icon,
    required this.type,
    this.onSubmitted,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final ProfileInfoType type;
  final Function? onSubmitted;

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final TextEditingController _controller = TextEditingController();
  bool _validate = false;

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  buildInputDecoration() {
    return InputDecoration(
        filled: true,
        fillColor: colorLogo[100],
        focusColor: colorLogo[100],
        focusedBorder: kTransparentOutlineBorders,
        hintText: widget.text,
        enabledBorder: kTransparentOutlineBorders,
        errorText: _validate ? 'DisplayName can\'t be empty' : null,
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        suffixIcon: widget.type == ProfileInfoType.displayName
            ? const Icon(
                CupertinoIcons.pencil_circle,
                color: Colors.black,
              )
            : null,
        disabledBorder: kTransparentOutlineBorders,
        border: kTransparentOutlineBorders);
  }

  Widget buildTxtEditingButton() {
    return TextField(
      cursorColor: Colors.grey,
      decoration: buildInputDecoration(),
      enabled: widget.type == ProfileInfoType.displayName,
      controller: _controller,
      onSubmitted: widget.type == ProfileInfoType.displayName
          ? (value) {
              if (_controller.text.isNotEmpty) {
                widget.onSubmitted!(value);
                _validate = false;
              } else {
                _validate = true;
              }
              setState(() {});
            }
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: buildTxtEditingButton());
  }
}
