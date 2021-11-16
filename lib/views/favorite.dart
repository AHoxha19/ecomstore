import 'package:flutter/widgets.dart';

/// Display the favorite products
class FavoriteView extends StatelessWidget {
  const FavoriteView({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 1: Favorite',
      style: optionStyle,
    );
  }
}
