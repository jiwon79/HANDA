import 'package:flutter/material.dart';

class FooterIcon extends StatelessWidget {
  const FooterIcon({
    Key? key,
    required this.color,
    this.child = const Text(''),
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      margin: EdgeInsets.fromLTRB(13, 0, 3, 0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Center(child: child),
    );
  }
}
