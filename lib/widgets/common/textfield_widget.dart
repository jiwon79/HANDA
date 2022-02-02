import 'package:flutter/material.dart';

const outlineStyle = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xff707070),
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0))
);

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
      child: TextField(
        onChanged: (text) {
          onChanged(text);
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500
          ),
          labelText: label,
          enabledBorder: outlineStyle,
          focusedBorder: outlineStyle,
        ),
      ),
    );
  }
}

