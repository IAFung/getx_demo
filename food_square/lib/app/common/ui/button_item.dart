import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final double fontSize;
  const ButtonItem({Key key, this.icon, this.title, this.fontSize = 14})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        icon,
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: TextStyle(fontSize: fontSize),
        )
      ],
    );
  }
}
