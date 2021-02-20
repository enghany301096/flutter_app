import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyButton.dart';
import 'package:flutter_app/HelpUI/MyDefaultText.dart';
import 'package:flutter_app/HelpUI/MySizedBox.dart';
import 'package:flutter_app/Login/HelpLoginUI/ErrorInputs.dart';
import 'package:flutter_app/Login/HelpLoginUI/MyTextFormInput.dart';
import 'package:flutter_app/Models/MyMainModel.dart';
import 'package:flutter_app/Styles/MyColors.dart';
import 'package:flutter_app/Styles/TextStyles.dart';


// ignore: must_be_immutable
class CompanySignUp extends StatelessWidget {
  final MyMainModel model;

  CompanySignUp({this.model});

  int _currentStep = 0;
  final GlobalKey<FormState> _formKey1 = GlobalKey();
  final GlobalKey<FormState> _formKey2 = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyComNoController = TextEditingController();
  TextEditingController _companyWebsiteController = TextEditingController();
  TextEditingController _companyEmpNoController = TextEditingController();
  TextEditingController _companyNotesController = TextEditingController();

  bool inputValidation;
  List<String> companySize = [
    "Small",
    "Medium",
    "Large",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/companySignUp.png'),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Stepper(
                      type: StepperType.vertical,
                      currentStep: _currentStep,
                      onStepTapped: (int step) =>
                          setState(() => _currentStep = step),
                      onStepContinue: _currentStep == 0
                          ? () => setState(() => _currentStep += 1)
                          : null,
                      onStepCancel: _currentStep > 0
                          ? () => setState(() => _currentStep -= 1)
                          : null,
                      controlsBuilder: (BuildContext context,
                              {VoidCallback onStepContinue,
                              VoidCallback onStepCancel}) =>
                          stepController(onStepContinue, onStepCancel),
                      steps: <Step>[
                        Step(
                          title: Text(
                            model.titleOf('CompanyOwner'),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                          content: stepOne(),
                          isActive: _currentStep == 0,
                          state: _currentStep == 0
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: Text(
                            model.titleOf('companyInfo'),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                          content: stepTwo(),
                          isActive: _currentStep == 1,
                          state: _currentStep == 1
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                      ],
                    ),
                  ),
                  MyButton(
                    buttonName: 'signUp',
                    bWidth: 240,
                    bHeight: 46,
                    model: model,
                    press: () {
                      if (_formKey1.currentState.validate() &&
                          _formKey2.currentState.validate()) {
                        print("validate input user");
                        setState(() => inputValidation = true);
                        Navigator.pushNamed(context, '/home');
                      } else {
                        print("not validate input user");
                        setState(() => inputValidation = false);
                        // _currentStep = 0;
                      }
                    },
                  ),
                  inputValidation == null
                      ? Container()
                      : ErrorInputs(
                          caseState: inputValidation,
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  stepController(VoidCallback onStepContinue, VoidCallback onStepCancel) {
    return Center(
      heightFactor: 2,
      child: SizedBox(
          width: 120,
          height: 40,
          child: RaisedButton(
            color: inputValidation == null
                ? MyColors().colorBlue
                : inputValidation
                    ? MyColors().colorGreen
                    : Colors.red,
            child: MyDefaultTextBox(
              textLabel: _currentStep == 0 ? 'NEXT' : 'PREV',
              textStyle: MyStyles().textStylesWhite_14,
            ),
            onPressed: _currentStep == 0 ? onStepContinue : onStepCancel,
          )),
    );
  }

  stepOne() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey1,
        child: Column(
          ///----------------for Comapny owner or Company Admin--------------//
          children: [
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
            MyTextFormInput(
              textLabel: "PhoneNumber1",
              model: model,
              iconData: Icons.call,
              textController: _phoneController,
              textType: 0,
            ),
          ],
        ));
  }

  stepTwo() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey2,
        child: Column(
          children: [
            ///----------------Company Name-----------//
            MyTextFormInput(
              textLabel: "companyName",
              model: model,
              iconData: Icons.home_work_rounded,
              textController: _companyNameController,
              textType: 0,
            ),

            ///----------------company CommNo------------//
            MyTextFormInput(
              textLabel: "companyCommNo",
              model: model,
              iconData: Icons.credit_card_rounded,
              textController: _companyComNoController,
              textType: 0,
            ),

            ///----------------company Web Site------------//
            MyTextFormInput(
              textLabel: "companyWebSite",
              model: model,
              iconData: Icons.http_rounded,
              textController: _companyWebsiteController,
              textType: 0,
            ),
            ///----------------company Notes------------//
            MyTextFormInput(
              textLabel: "CompanyNotes",
              model: model,
              iconData: Icons.note_add_rounded,
              textController: _companyNotesController,
              textType: 2,
            ),
            // UserPolicy(
            //   model: model,
            // ),
          ],
        ));
  }
}
