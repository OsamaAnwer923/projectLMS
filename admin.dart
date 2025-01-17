import 'dart:io';
import 'data.dart';
import 'mainMenu.dart';

adminLogIn() {
  print("Enter your ID number");
  String idNumber = stdin.readLineSync()!;
  print("Enter your password");
  String password = stdin.readLineSync()!;
  String condition = '0';
  for (int i = 0; i < adminIdAndPassword.length; i++) {
    if (idNumber == adminIdAndPassword[i]["adminId"] &&
        password == adminIdAndPassword[i]["password"]) {
          print('==============================');
      print("thanks for login");
      condition = '1';
      print("${adminIdAndPassword[i]["name"]}! Welcome to the portal");
      adminMenu();
    }
  }
  if (condition == '0') {
    print("Entered id or password is wrong");
    print("press 0 to re-enter the password and 1 for main menu");
    String reEnterMainMenue = stdin.readLineSync()!;
    if (reEnterMainMenue == '0') {
      adminLogIn();
    }
    if (reEnterMainMenue == '1') {
      mainMenu();
    }
  }
}

adminMenu() {
  print("press 1 to add subject");
  print("press 2 to delete subject");
  print("press 3 to view subjects");
  print('press 4 for fee');
  print('press * to logout');
  String adminMenuSelection = stdin.readLineSync()!;
  if (adminMenuSelection == '1') {
    addSubject();
  } else if (adminMenuSelection == '2') {
    deleteSubject();
  } else if (adminMenuSelection == '3') {
    viewSubjects();
  } else if (adminMenuSelection == '4') {
    feeAdmin();
  } else if (adminMenuSelection == '*') {
    print("successfully logout");
    mainMenu();
  } else {
    print('==============================');
    print("enter correct key");
    adminMenu();
  }
}

addSubject() {
  print("enter subject name");
  String addSubjectAdmin = stdin.readLineSync()!;
  if (subjects.contains(addSubjectAdmin)) {
    print('==============================');
    print("subject is already included");
    adminMenu();
  } else {
    subjects.add(addSubjectAdmin);
    print('==============================');
    print("subject is successfully added");
    print('==============================');
    adminMenu();
  }
}

deleteSubject() {
  print("enter subject name");
  String deleteSubjectName = stdin.readLineSync()!;
  if (subjects.contains(deleteSubjectName)) {
    subjects.remove(deleteSubjectName);
    print("successfully delete the subject");
    print('==============================');
    adminMenu();
  } else {
    print("subject is not present");
    print('==============================');
    adminMenu();
  }
}

viewSubjects() {
  if (subjects.isNotEmpty) {
    print('==============================');
    print("subjects are:");
    for (String subject in subjects) {
      print(subject);
      print('==============================');
      adminMenu();
    }
  } else {
    print('==============================');
    print('No subject in this term');
    print('==============================');
    adminMenu();
  }
}

feeAdmin() {
  print('==============================');
  print("enter id of the studnet");
  String feeStudentId = stdin.readLineSync()!;
  String feeCondition = '0';
  for (int index = 0; index < studentIdAndPassword.length; index++) {
    if (studentIdAndPassword[index]["studentId"] == feeStudentId) {
      if (studentIdAndPassword[index]["fees status"] == true) {
        print("fee is already paid");
        print('==============================');
        adminMenu();
        feeCondition = '1';
      } else if (studentIdAndPassword[index]["fees status"] == false) {
        studentIdAndPassword[index]["fees status"] = true;
        print("fee is submitted");
        print('==============================');
        adminMenu();
        feeCondition = '1';
      }
    }
  }
  if (feeCondition == '0') {
    print('student id is not registered');
    print('==============================');
    adminMenu();
  }
}
