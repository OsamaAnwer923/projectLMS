import 'dart:io';

import 'data.dart';
import 'mainMenu.dart';

parentLogIn() {
  print("Enter your ID number");
  String idNumber = stdin.readLineSync()!;
  print("Enter your password");
  String password = stdin.readLineSync()!;
  String condition = '0';
  for (int i = 0; i < parentIdAndPassword.length; i++) {
    if (idNumber == parentIdAndPassword[i]["parentId"] &&
        password == parentIdAndPassword[i]["password"]) {
      print('==============================');
      print("thanks for login");
      condition = '1';

      parentsMenu();
    }
  }
  if (condition == '0') {
    print("Entered id or password is wrong");
    print("press 0 to re-enter the password and 1 for main menu");
    String reEnterMainMenue = stdin.readLineSync()!;
    if (reEnterMainMenue == '0') {
      parentLogIn();
    }
    if (reEnterMainMenue == '1') {
      mainMenu();
    }
  }
}

parentsMenu() {
  print('enter 1 to view subjects');
  print('enter 2 to see the status of fee');
  print('enter * to logout');
  String parentsMenuSelection = stdin.readLineSync()!;
  if (parentsMenuSelection == '1') {
    print('subjects of the current semester are');
    for (String subject in subjects) {
      print(subject);
    }
    parentsMenu();
  }
  if (parentsMenuSelection == '2') {
    print("enter name of your child");
    String nameOfchild = stdin.readLineSync()!;
    String parentFeeCondition = '0';
    for (int index = 0; index < studentIdAndPassword.length; index++) {
      if (studentIdAndPassword[index]["name"] == nameOfchild) {
        if (studentIdAndPassword[index]["fees status"] == true) {
          print('==============================');
          print("fee is already paid");
          parentFeeCondition = '1';
          print('==============================');
          parentsMenu();
        } else if (studentIdAndPassword[index]["fees status"] == false) {
          print('==============================');
          print("fee is unpaid");
          parentFeeCondition = '1';
          print('==============================');
          parentsMenu();
        }
      }
    }
    if (parentFeeCondition == '0') {
      print('student id is not registered');
      print('==============================');
      parentsMenu();
    }
  } else if (parentsMenuSelection == '*') {
    print('successfully logout');
    print('==============================');
    mainMenu();
  } else {
    print('==============================');
    print("enter correct key");
    parentsMenu();
  }
}
