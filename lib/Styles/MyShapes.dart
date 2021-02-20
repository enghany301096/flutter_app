import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Styles/TextStyles.dart';

class MyShapes {
  RoundedRectangleBorder get myShape10 {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
  }

  RoundedRectangleBorder get myShape15 {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0));
  }

  RoundedRectangleBorder get myShape20 {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));
  }
  RoundedRectangleBorder get myShapeAppBar10 {
    return RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)));
  }
  RoundedRectangleBorder get myShapeAppBar15{
    return RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)));
  }
  RoundedRectangleBorder get myShapeAppBar20{
    return RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)));
  }

  InputDecoration get myInputDecoration1 {
    return InputDecoration(
      labelStyle: MyStyles().textStylesBlack_20,
      prefixIcon: Icon(Icons.email),
      labelText: "UserName",
      hintStyle: TextStyle(fontSize: 10, color: Colors.white),
    );
  }
}
