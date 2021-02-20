import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TextStyles.dart';

class MyTextInputDecoration {
  final String labelText;
  final IconData iconData;

  MyTextInputDecoration(this.labelText, this.iconData);

  InputDecoration get myTextInputDecorationBlack_14 {
    return InputDecoration(
      labelStyle: MyStyles().textStylesBlack_14,
      prefixIcon: Icon(iconData),
      labelText: labelText,
      hintStyle: MyStyles().textStylesBlack_14,
    );
  }

  InputDecoration get myTextInputDecorationWhite_20 {
    return InputDecoration(
      labelStyle: MyStyles().textStylesWhite_20,
      prefixIcon: Icon(iconData),
      labelText: labelText,
      hintStyle: MyStyles().textStylesWhite_20,
    );
  }
}
