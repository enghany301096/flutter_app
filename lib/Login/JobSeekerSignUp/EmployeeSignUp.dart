import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyButton.dart';
import 'package:flutter_app/HelpUI/MyDefaultText.dart';
import 'package:flutter_app/HelpUI/MySizedBox.dart';
import 'package:flutter_app/Login/HelpLoginUI/ErrorInputs.dart';
import 'package:flutter_app/Login/HelpLoginUI/ErrorMessage.dart';
import 'package:flutter_app/Login/splashScreen/NextStepButton.dart';
import 'package:flutter_app/Models/MyMainModel.dart';
import 'package:flutter_app/Styles/MyColors.dart';
import 'package:flutter_app/Styles/MyShapes.dart';
import 'package:flutter_app/Styles/TextStyles.dart';
import '../HelpLoginUI/MyTextFormInput.dart';

// ignore: must_be_immutable
class EmployeeSignUp extends StatelessWidget {
  final MyMainModel model;

  EmployeeSignUp({this.model});

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  bool inputValidation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Center(
            child: SingleChildScrollView(
              ///----------------User inputs SignIn------------//
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///----------------for Comapny owner or Company Admin--------------//
                      Image.asset('assets/signUpEmp.png'),
                      MySizedBox(
                        byHeight: 20,
                      ),

                      ///----------------User inputs Name------------//
                      MyTextFormInput(
                        textLabel: "UserName",
                        model: model,
                        iconData: Icons.person,
                        textController: _nameController,
                        textType: 0,
                      ),

                      ///----------------User inputs Email------------//
                      MyTextFormInput(
                        textLabel: "E_Mail",
                        model: model,
                        iconData: Icons.mail,
                        textController: _emailController,
                        textType: 0,
                      ),

                      ///----------------User inputs Password------------//
                      MyTextFormInput(
                        textLabel: "Password",
                        model: model,
                        iconData: Icons.lock_rounded,
                        textController: _passwordController,
                        textType: 1,
                      ),

                      ///----------------User inputs Confirm Password------------//
                      MyTextFormInput(
                        textLabel: "Confirm Password",
                        model: model,
                        iconData: Icons.lock_rounded,
                        textController: _confirmController,
                        textConfirmController: _passwordController,
                        textType: 1,
                      ),

                      ///----------------User inputs phone number------------//
                      MyTextFormInput(
                        textLabel: "PhoneNumber1",
                        model: model,
                        iconData: Icons.call,
                        textController: _phoneController,
                        textType: 0,
                      ),
                      MySizedBox(
                        byHeight: 15,
                      ),
                      signUpButton(context, setState),
                      linkCreateAccount(context),
                      inputValidation == null
                          ? Container()
                          : ErrorInputs(
                              caseState: inputValidation,
                            )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  signUpButton(BuildContext context, StateSetter setState) {
    return MyButton(
      ///--------button SignUp an account-------//
      buttonName: 'signUp',
      bWidth: 240,
      bHeight: 46,
      model: model,
      press: () {
        if (_formKey.currentState.validate()) {
          print("is validate input");
          setState(() => inputValidation = true);
          Navigator.pushNamed(context, '/home');
        } else {
          setState(() => inputValidation = false);
          ErrorMessage(
            scaffoldKey: _scaffoldKey,
          );
        }
      },
    );
  }

  linkCreateAccount(BuildContext context) {
    return Row(
      ///---if you already have an account then go to login screen---///
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NextStepButton(
          buttonName: model.titleOf('login'),
          buttonID: 1,
          alignment: Alignment.center,
          press: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        MyDefaultTextBox(
          textLabel: model.titleOf('haveAccount'),
          textStyle: MyStyles().textStylesBlack_14,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
