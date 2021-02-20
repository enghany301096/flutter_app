import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/MyMainModel.dart';
import 'package:flutter_app/Styles/MyColors.dart';
import 'package:flutter_app/Styles/MyShapes.dart';
import 'package:flutter_app/Styles/TextStyles.dart';

import 'MyDefaultText.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final double bWidth, bHeight;
  final MyMainModel model;
  final void Function() press;

  MyButton(
      {this.buttonName,
      this.model,
      this.press,
      this.bWidth = 250,
      this.bHeight = 46});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bWidth,
      height: bHeight,
      child: RaisedButton(
        onPressed: press,
        child: MyDefaultTextBox(
          textLabel: model.titleOf(buttonName),
          textStyle: MyStyles().textStylesWhite_20,
        ),
        shape: MyShapes().myShape10,
        color: MyColors().colorGreen,
      ),
    );
  }
}
