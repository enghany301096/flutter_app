import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/MyMainModel.dart';
import 'package:flutter_app/Styles/TextInputDecoration.dart';

class MyTextFormInput extends StatelessWidget {
  final MyMainModel model;
  final TextEditingController textController;
  final TextEditingController textConfirmController;
  final String textLabel;
  final IconData iconData;
  final int textType;
  MyTextFormInput(
      {this.model,
      this.textController,
      this.textLabel,
      this.iconData,
      this.textType,
      this.textConfirmController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: TextFormField(
        controller: textController,
        enableInteractiveSelection: true,
        textAlign: TextAlign.right,
        obscureText: textType == 1 ? true : false,
        minLines: textType == 2 ? 1 : 1,
        maxLines: textType == 2 ? 4 : 1,
        decoration: MyTextInputDecoration(model.titleOf(textLabel), iconData)
            .myTextInputDecorationBlack_14,
        validator: (String val) {
          return textValidator(val, "* ${model.titleOf(textLabel)}");
        },
      ),
    );
  }

  String textValidator(String val, String message) {
    if (textConfirmController == null) {
      if (val.toString().isEmpty) {
        return message;
      } else {
        return null;
      }
    } else {
      if (textController == null) {
        return message;
      } else if (textConfirmController.text != textController.text) {
        return "*" + message;
      } else {
        return null;
      }
    }
  }
}
