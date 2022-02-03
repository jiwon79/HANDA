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
    this.maxLength = 30,
    this.suffix = const Text(''),
  }) : super(key: key);

  final String label;
  final Function onChanged;
  final Widget suffix;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
      child: TextField(
        maxLength: maxLength,
        onChanged: (text) {
          onChanged(text);
        },
        decoration: InputDecoration(
          counterText: "",
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500
          ),
          labelText: label,
          enabledBorder: outlineStyle,
          focusedBorder: outlineStyle,
          suffixIcon: suffix,
          )
        ),
    );
  }
}

