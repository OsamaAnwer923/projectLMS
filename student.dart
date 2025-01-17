import 'dart:io';

import 'data.dart';
import 'mainMenu.dart';

// enter id and password condition if id and password matched return 1 and if not matched execute command using condition 0 used for loop to check the correct id and password
studentLogIn() {
  print("Enter your student ID number");
  String idNumber = stdin.readLineSync()!;
  print("Enter your password");
  String password = stdin.readLineSync()!;
  String condition = '0';
  for (int studentIndex = 0;
      studentIndex < studentIdAndPassword.length;
      studentIndex++) {
    if (idNumber == studentIdAndPassword[studentIndex]["studentId"] &&
        password == studentIdAndPassword[studentIndex]["password"]) {
      print('==============================');

      print("thanks for login");
      condition = '1';
      print(
          "${studentIdAndPassword[studentIndex]["name"]}!welcome to the portal");
      executeStudentRole();
    }
  }
  if (condition == '0') {
    print("Entered id or password is wrong");
    print("press 0 to re-enter the password and 1 for main menu");
    String reEnterMainMenue = stdin.readLineSync()!;
    if (reEnterMainMenue == '0') {
      studentLogIn();
    }
    if (reEnterMainMenue == '1') {
      mainMenu();
    }
  }
}

executeStudentRole() {
  studentMenu();
}

studentMenu() {
  print('==============================');
  print('enter 1 to view subjects');
  print('enter 2 to see the status of fee');
  print('enter * to logout');
  print('==============================');
  String studentMenuSelection = stdin.readLineSync()!;
  if (studentMenuSelection == '1') {
    print('subjects of the current semester are');
    for (String subject in subjects) {
      print(subject);
      print('==============================');
    }
    studentMenu();
  }
  if (studentMenuSelection == '2') {
    print("enter your name");
    String nameOfchild = stdin.readLineSync()!;
    String parentFeeCondition = '0';
    for (int index = 0; index < studentIdAndPassword.length; index++) {
      if (studentIdAndPassword[index]["name"] == nameOfchild) {
        if (studentIdAndPassword[index]["fees status"] == true) {
          print("fee is paid");
          parentFeeCondition = '1';
          print('==============================');
          studentMenu();
        } else if (studentIdAndPassword[index]["fees status"] == false) {
          print("fee is unpaid");
          parentFeeCondition = '1';
          studentMenu();
        }
      }
    }
    if (parentFeeCondition == '0') {
      print('enter correct name');
      studentMenu();
    }
  }
  if (studentMenuSelection == '*') {
    print('successfully logout');
    print('==============================');

    mainMenu();
  }
}
