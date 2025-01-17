import 'dart:io';
import 'admin.dart';
import 'parent.dart';
import 'student.dart';

mainMenu() {
  print("Press 1 for Student Section");
  print("Press 2 for Admin Section");
  print("Press 3 for Parent Section");
  String menuSelection = stdin.readLineSync()!;
  if (menuSelection == '1') {
    studentLogIn();
  } else if (menuSelection == '2') {
    adminLogIn();
  } else if (menuSelection == '3') {
    parentLogIn();
  } else {
    print("enter correct number");
    mainMenu();
  }
}
