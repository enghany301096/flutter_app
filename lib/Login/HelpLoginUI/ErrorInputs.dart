import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorInputs extends StatelessWidget {
  final bool caseState;

  const ErrorInputs({this.caseState});

  @override
  Widget build(BuildContext context) {
    return Icon(
      caseState ? Icons.check : Icons.close,
      color: caseState ? Colors.green : Colors.red,
    );
  }
}
