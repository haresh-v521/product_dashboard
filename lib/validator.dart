import 'package:flutter/cupertino.dart';

//final TextEditingController _confirmpassController = TextEditingController();

class NameFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) return "Enter Name";
    String pattern = r'^[a-z A-Z]';

    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "Enter Valid Name!";
    }
    return null;
  }
}

class EmailFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) return "Enter Email";
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "Enter Valid Email!";
    }
    return null;
  }
}

class PasswordFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) return "Enter Password";
    if (value.length < 8) {
      return "Password must be more then 6 character";
    }
    return null;
  }
}

class ConfirmPassFieldValidator {
  String? confirmPwd;
  ConfirmPassFieldValidator({this.confirmPwd});
  String? validate(String? value) {
    if (value!.isEmpty) {
      return "Please Re-Enter Password";
    } else if (value != confirmPwd) {
      return "Password Not Match";
    } else {
      return null;
    }
  }
}
