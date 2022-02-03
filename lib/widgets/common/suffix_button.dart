import 'package:flutter/material.dart';

class SuffixButton extends StatelessWidget {
  const SuffixButton({
    Key? key,
    required this.content,
    required this.onPress,
  }) : super(key: key);

  final String content;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.fromLTRB(0, 5, 8, 5),
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: Text(content,
          style: TextStyle(
            fontSize: 11,
            fontFamily: 'noto',
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            } else {
              return Color(0xff343434);
            }
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )
          )
        ),

      ),
    );
  }
}
