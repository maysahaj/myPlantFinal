import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:string_validator/string_validator.dart';

class MyProvider extends ChangeNotifier {
  String email;

  String password;
  Color color = Colors.white;
  int numPlant = 0;
  int size = 0;
  bool spinner = false;

  int selectExpansionTile;

  String selected = 'Procissing';

  changeSelcted( String value) {
    this.selected = value;
    print(selected);
    notifyListeners();
  }

  updateOrder() {}

  toggleSelectExpansionTile(int i) {
    this.selectExpansionTile = i;
    notifyListeners();
  }

  changeValue(String value1, String value2) {
    value1 = value2;
    notifyListeners();
  }

  toggleSpinner() {
    spinner = !spinner;
    notifyListeners();
  }

  int total = 0;
  int totalPriceInUi = 0;

  totalPrize(List<Map> value) {
    for (Map map in value) {
      this.total += (map['priceColumn'] * map['numPlantColumn']);
      notifyListeners();
    }
  }

  getTotalPriceInUi(int value) {
    this.totalPriceInUi = value;
    notifyListeners();
  }

  IconData iconData = FontAwesomeIcons.eye;
  bool toggleEye = true;

  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  saveEmail(String value) {
    this.email = value;
    notifyListeners();
  }

  savePassword(String value) {
    this.password = value;
    notifyListeners();
  }

  validateEmail(String value) {
    if (value == null || value == '') {
      return ' this field is required ';
    } else if (!isEmail(value)) {
      return 'invalid Email ';
    }
  }

  validatePassword(String value) {
    if (value == null || value == '') {
      return ' this field is required ';
    } else if (!isAlphanumeric(value)) {
      return 'invalid Password ';
    }
  }

  submit(GlobalKey<FormState> globalKey) {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();

      notifyListeners();
    } else {
      notifyListeners();
      return;
    }
  }

  getNumCup(int value) {
    this.numPlant = value;
    notifyListeners();
  }

  addNum() {
    numPlant++;
    notifyListeners();
  }

  subNum() {
    numPlant--;
    notifyListeners();
  }

  selectNumSize({int num}) {
    size = num;
    notifyListeners();
  }


  fmToggleEye() {
    toggleEye = !toggleEye;
    iconData = toggleEye ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye;
    notifyListeners();
  }
}
