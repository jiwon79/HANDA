import 'package:flutter/material.dart';

void defaultOnPress(context) {
  Navigator.pop(context);
}

void alertWidget({
  required context,
  required title,
  content,
  onPress = defaultOnPress,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: content == null ? null : Text(content),
        actions: [
          TextButton(
            child: Text("확인"),
            onPressed: () {
              onPress(context);
            },
          )
        ],
      );
    }
  );
}