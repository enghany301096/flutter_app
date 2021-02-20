import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ErrorMessage({this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return showErrorMessage();
  }

  showErrorMessage() {
    return scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Container(
        height: 100,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "failed to Login Account!!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.error_outline, color: Colors.red),
            Text(
              "please enter valid data or Confirm your internet connection",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    ));
  }
}
