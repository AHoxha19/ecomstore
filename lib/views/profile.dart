import 'package:flutter/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 3: Profile',
      style: optionStyle,
    );
  }
}
