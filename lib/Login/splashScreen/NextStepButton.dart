import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyDefaultText.dart';
import 'package:flutter_app/Styles/MyColors.dart';
import 'package:flutter_app/Styles/MyShapes.dart';
import 'package:flutter_app/Styles/TextStyles.dart';

class NextStepButton extends StatelessWidget {
  final String buttonName;
  final int buttonID;
  final AlignmentGeometry alignment;
  final void Function() press;
  const NextStepButton(
      {this.buttonName, this.press, this.alignment, this.buttonID});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: FlatButton(
        minWidth: 140,
        onPressed: press,
        child: MyDefaultTextBox(
          textLabel: buttonName,
          textAlign: TextAlign.center,
          textStyle: buttonID == 1
              ? MyStyles().textStylesBlue_16
              : MyStyles().textStylesWhite_18,
        ),
        color: buttonID == 1 ? Colors.white : MyColors().colorGreen,
        shape: MyShapes().myShape10,
      ),
    );
  }
}
