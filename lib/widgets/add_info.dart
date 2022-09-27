import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/providers/catalog_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// enum used to know the type of TextField
enum AddInfoType { name, category, imageUrl, price, favorite }

class AddInfo extends StatefulWidget {
  const AddInfo({
    Key? key,
    required this.text,
    required this.icon,
    required this.type,
    this.onSubmitted,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final AddInfoType type;
  final Function? onSubmitted;

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  final TextEditingController _controller = TextEditingController();
  bool _validate = false;
  bool favorite = false;

  String categoryValue = "jacket";
  List<String> categories = ["jacket", "sneaker", "hat"];

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
        disabledBorder: kTransparentOutlineBorders,
        border: kTransparentOutlineBorders);
  }

  Widget buildTxtEditingButton() {
    return TextField(
        cursorColor: Colors.grey,
        decoration: buildInputDecoration(),
        controller: _controller,
        onChanged: (value) {
          if (_controller.text.isNotEmpty) {
            widget.onSubmitted!(value);
            _validate = false;
          } else {
            _validate = true;
          }
          setState(() {});
        });
  }

  Widget buildCategoryDropdown() {
    return DropdownButton<String>(
        value: categoryValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        underline: Container(
          height: 2,
          color: colorLogo[100],
        ),
        focusColor: colorLogo[100],
        dropdownColor: colorLogo[100],
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            categoryValue = value!;
            widget.onSubmitted!(categoryValue);
          });
        },
        items: categories.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  Widget buildFavoriteSwitch() {
    return Container(
      decoration: BoxDecoration(
        color: colorLogo[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                widget.icon,
                color: Colors.grey,
              ),
              Switch(
                // This bool value toggles the switch.
                value: favorite,
                activeColor: colorLogo[500],
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    favorite = value;
                    widget.onSubmitted!(favorite);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == AddInfoType.imageUrl) {
      _controller.text = context.read<CatalogProvider>().shopItemToAdd.imageUrl;
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: widget.type == AddInfoType.category
            ? buildCategoryDropdown()
            : widget.type == AddInfoType.favorite
                ? buildFavoriteSwitch()
                : buildTxtEditingButton());
  }
}
