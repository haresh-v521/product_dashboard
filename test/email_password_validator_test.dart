import 'package:flutter_test/flutter_test.dart';
import 'package:testeui/validator.dart';

void main() {
  test('Empty Name Test', () {
    final result = NameFieldValidator.validate('');
    expect(result, 'Enter Name');
  });
  test("Invalid Name Test", () {
    var result = NameFieldValidator.validate('1223');
    expect(result, "Enter Valid Name!");
  });

  test("Valid Name Test", () {
    var result = NameFieldValidator.validate("jaydeep");
    expect(result, null);
  });

  test('Empty Email Test', () {
    final result = EmailFieldValidator.validate('');
    expect(result, 'Enter Email');
  });

  test("Invalid Email Test", () {
    var result = EmailFieldValidator.validate('jaydeep');
    expect(result, "Enter Valid Email!");
  });

  test("Valid Email Test", () {
    var result = EmailFieldValidator.validate("jaydeep.dignizant@gmail.com");
    expect(result, null);
  });

  test('Empty Password Test', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Enter Password');
  });
  test("Invalid Password Test", () {
    var result = PasswordFieldValidator.validate("123");
    expect(result, "Password must be more then 8 character");
  });

  test("Valid Password Test ", () {
    var result = PasswordFieldValidator.validate("jaydeep1234");
    expect(result, null);
  });

  test('Empty ConfirmPassword Test', () {
    var result = ConfirmPassFieldValidator(confirmPwd: "jaydeep1234").validate('');
    expect(result, 'Please Re-Enter Password');
  });
  test("Invalid ConfirmPassword Test", () {
    var result = ConfirmPassFieldValidator(confirmPwd: "jaydeep1234").validate("123");
    expect(result, "Password Not Match");
  });

  test("Valid ConfirmPassword Test ", () {
    var result = ConfirmPassFieldValidator(confirmPwd: "jaydeep1234").validate("jaydeep1234");
    expect(result, null);
  });



}
