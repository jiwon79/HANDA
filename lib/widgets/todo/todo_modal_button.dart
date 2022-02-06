import 'package:flutter/material.dart';

class TodoModalButton extends StatelessWidget {
  const TodoModalButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.action,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.black
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xfff9f9f9),
                borderRadius: BorderRadius.circular(30)
            ),
            child: icon,
          ),
          Text(title,
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'noto',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
      onPressed: () {
        action();
        Navigator.pop(context);
      },
    );
  }
}
