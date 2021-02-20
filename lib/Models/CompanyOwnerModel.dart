import 'package:flutter/cupertino.dart';

class CompanyOwner {
  final String compOwnerFullName;
  final String compEmail;
  final String compPhone1;
  final String compPhone2;
  final String compName;
  final String compCommerceID;
  final String compWebSite;
  final String compCountry;
  final String compCity;
  final String compScale;
  final String compEmployeeNumber;
  final String compNotes;

  CompanyOwner(
      {@required this.compOwnerFullName,
      @required this.compEmail,
      @required this.compPhone1,
      @required this.compPhone2,
      @required this.compName,
      @required this.compCommerceID,
      @required this.compWebSite,
      @required this.compCountry,
      @required this.compCity,
      @required this.compScale,
      @required this.compEmployeeNumber,
      this.compNotes});
}
