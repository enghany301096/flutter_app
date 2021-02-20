import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyButton.dart';
import 'package:flutter_app/HelpUI/MySizedBox.dart';
import 'package:flutter_app/Models/MyMainModel.dart';

// ignore: must_be_immutable
class SelectLogin extends StatelessWidget {
  MyMainModel model = MyMainModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/select.png'),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  buttonName: 'jobSeekerSignUp',
                  bWidth: 240,
                  bHeight: 46,
                  model: model,
                  press: () {
                    Navigator.pushNamed(context, '/signUpEmployee');
                  },
                ),
                MySizedBox(
                  byHeight: 10,
                ),
                MyButton(
                  buttonName: 'companySignUp',
                  bWidth: 240,
                  bHeight: 46,
                  model: model,
                  press: () {
                    Navigator.pushNamed(context, '/signUpCompany');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
