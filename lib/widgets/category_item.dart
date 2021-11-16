import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final String title;
  final bool isSelected;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: isSelected ? Colors.black : Colors.grey.shade200,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(title,
              style: isSelected
                  ? const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)
                  : const TextStyle(color: Colors.black))),
    );
  }
}

class CategoryItem {
  String title;
  bool isSelected = false;
  CategoryItem(
    this.title,
  );
}
