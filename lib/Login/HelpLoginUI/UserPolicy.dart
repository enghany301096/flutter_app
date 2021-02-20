import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyDefaultText.dart';
import 'package:flutter_app/Models/MyMainModel.dart';

class UserPolicy extends StatelessWidget {
  final MyMainModel model;
  UserPolicy({this.model});
  static bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          alignment: Alignment.center,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: checkboxValue,
                  onChanged: (bool val) {
                    setState(() {
                      checkboxValue = val;
                    });
                  }),
              FlatButton(
                  onPressed: () {},
                  child: MyDefaultTextBox(
                    textLabel: model.titleOf('Policy'),
                  ))
            ],
          ),
        );
      },
    );
  }
}
