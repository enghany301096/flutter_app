import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyDefaultText.dart';

class DropdownSelection extends StatelessWidget {
  final List<String> scale;
  final String label;
  DropdownSelection({this.scale, this.label});
  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    print(scale);
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 150,
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  child: MyDefaultTextBox(
                    textLabel: scale[0],
                    textAlign: TextAlign.right,
                  ),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: MyDefaultTextBox(
                    textLabel: scale[1],
                    textAlign: TextAlign.right,
                  ),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: MyDefaultTextBox(
                    textLabel: scale[2],
                    textAlign: TextAlign.right,
                  ),
                  value: 2,
                ),
              ],
              value: currentItem,
              onChanged: (val) => currentItem = val,
            ),
          ),
          MyDefaultTextBox(
            textLabel: label,
            textAlign: TextAlign.right,
          )
        ],
      );
    });
  }
}
