import 'package:flutter/cupertino.dart';

class Employee {
  final String empFullName;
  final String empEMail;
  final String empPhone;
  final String empPassword;
  final String empTokenID;

  Employee(
      {@required this.empFullName,
      @required this.empEMail,
      @required this.empPhone,
      @required this.empPassword,
      @required this.empTokenID});
}
