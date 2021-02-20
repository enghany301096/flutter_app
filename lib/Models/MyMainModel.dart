import 'package:scoped_model/scoped_model.dart';

import 'CompanyOwnerModel.dart';
import 'StaticData.dart';

class MyMainModel extends Model {
  CompanyOwner companyOwner;
  int selectLanguage = 1;

  String titleOf(String title) {
    return selectLanguage == 1
        ? StaticData().arabicTitles[title]
        : StaticData().englishTitles[title];
  }
}
