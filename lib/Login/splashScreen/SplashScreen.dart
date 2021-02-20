import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HelpUI/MyDefaultText.dart';

import 'package:flutter_app/HelpUI/MySizedBox.dart';
import 'package:flutter_app/Models/MyMainModel.dart';
import 'package:flutter_app/Styles/MyColors.dart';
import 'package:flutter_app/Styles/MyShapes.dart';
import 'package:flutter_app/Styles/TextStyles.dart';

import '../splashScreen/NextStepButton.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  int currentItem = 1;
  int currentButton = 1;
  bool isMoved = false;
  MyMainModel model = MyMainModel();
  List<String> titles = [
    "hello and wellCome to our Community",
    "You will find your opportunity here"
  ];

  @override
  // ignore: must_call_super
  initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        currentItem = currentItem == 3 ? 0 : currentItem + 1;
        currentButton = currentItem;
      });
      if (currentItem == 0) {
        timer.cancel();
        currentItem = 1;
        currentButton = 1;

        isMoved
            ? print('is moved yet')
            : Navigator.pushNamed(context, '/select');
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: [
            companyLogo("gh"),
            PageView.builder(
              itemCount: 3,
              pageSnapping: true,
              onPageChanged: (int item) {
                setState(() {
                  currentItem = item + 1;
                  currentButton = currentItem;
                });
              },
              itemBuilder: (context, int index) {
                return pageCard();
              },
            ),
            buttonContainer(),
            NextStepButton(
              buttonName: model.titleOf('SKIP'),
              buttonID: 1,
              alignment: Alignment.bottomRight,
              press: () {
                currentItem = 0;
                isMoved = true;
                Navigator.pushNamed(context, '/select');
              },
            )
          ],
        ),
      ),
    );
  }

  companyLogo(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Container(
        alignment: Alignment.topCenter,
        child: Icon(
          Icons.clean_hands_rounded,
          size: 40,
          color: Colors.blue,
        ),
      ),
    );
  }

  pageCard() {
    return ClipRRect(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/start$currentItem.jpg',
            fit: BoxFit.contain,
          ),
          MySizedBox(
            byHeight: 10,
          ),
          currentItem == 3
              ? NextStepButton(
                  buttonName: model.titleOf('GetStarted'),
                  buttonID: 2,
                  alignment: Alignment.bottomCenter,
                  press: () {
                    currentItem = 0;
                    isMoved = true;
                    Navigator.pushNamed(context, '/select');
                  },
                )
              : MyDefaultTextBox(
                  textLabel: titles[currentItem - 1],
                  textAlign: TextAlign.center,
                  textStyle: MyStyles().textStylesBlack_16,
                )
        ],
      ),
    );
  }

  buttonContainer() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pointButton(
            bId: 1,
            currentButton: currentButton,
            press: () {
              setState(() {
                currentItem = 1;
                currentButton = 1;
              });
            },
          ),
          pointButton(
            bId: 2,
            currentButton: currentButton,
            press: () {
              setState(() {
                currentItem = 2;
                currentButton = 2;
              });
            },
          ),
          pointButton(
            bId: 3,
            currentButton: currentButton,
            press: () {
              setState(() {
                currentItem = 3;
                currentButton = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  pointButton({int bId, int currentButton, void Function() press}) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: 16,
          height: 16,
          child: RaisedButton(
            color: bId == currentButton ? MyColors().colorBlue : Colors.white24,
            onPressed: press,
            shape: MyShapes().myShape10,
          ),
        ));
  }
}
