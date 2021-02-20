import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyButton.dart';
import 'package:flutter_app/HelpUI/MyDefaultText.dart';
import 'package:flutter_app/HelpUI/MySizedBox.dart';
import 'package:flutter_app/Login/splashScreen/NextStepButton.dart';
import 'package:flutter_app/Models/MyMainModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'HelpLoginUI/ErrorInputs.dart';
import 'HelpLoginUI/MyTextFormInput.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isValidData;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MyMainModel model) {
      return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/jobSeeker.png'),
                  loginInputs(model),
                  MySizedBox(
                    byHeight: 20,
                  ),
                  MyButton(
                    buttonName: 'login',
                    bWidth: 240,
                    bHeight: 46,
                    model: model,
                    press: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          isValidData = true;
                        });
                        Navigator.pushNamed(context, '/home');
                        if (!true) {
                          ///----user login true--->>then go to Home page app-----///
                        } else {
                          ///----user login false--->>then show error message-----///
                        }
                      } else {
                        setState(() {
                          isValidData = false;
                        });
                      }
                    },
                  ),
                  linkNewAccount(model),
                  isValidData == null
                      ? Container()
                      : ErrorInputs(
                          caseState: isValidData,
                        )
                  //buttonLogin(model)
                ],
              ),
            ),
          ),
        ),
      );
    }); // This trailing comma makes auto-formatting nicer for build methods.
  }

  loginInputs(MyMainModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ///---------text user name--------//
        MyTextFormInput(
          textLabel: "E_Mail",
          textController: _nameController,
          iconData: Icons.person,
          model: model,
          textType: 0,
        ),
        MyTextFormInput(
          textLabel: "Password",
          textController: _passwordController,
          iconData: Icons.lock_rounded,
          model: model,
          textType: 1,
        ),
      ],
    );
  }

  linkNewAccount(MyMainModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NextStepButton(
          buttonName: model.titleOf('createAccount'),
          buttonID: 1,
          alignment: Alignment.center,
          press: () {
            Navigator.pushNamed(context, '/select');
          },
        ),
        MyDefaultTextBox(
          textLabel: model.titleOf("doNotHaveAccount"),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
