import 'package:flutter/cupertino.dart';

class MyDefaultTextBox extends StatelessWidget {
  final String textLabel;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const MyDefaultTextBox({this.textLabel, this.textStyle, this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(
      textLabel,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
