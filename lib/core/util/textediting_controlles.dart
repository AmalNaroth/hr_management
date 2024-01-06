import 'package:flutter/material.dart';

class AddNewEmployeeTextEditingControlls {
  static final TextEditingController conformPasswordController =
      TextEditingController();

  static String? departmentController;
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController employeeId = TextEditingController();
  static final TextEditingController firstNameController =
      TextEditingController();

  static final formKey = GlobalKey<FormState>();
  static String? joiningDateController;
  static final TextEditingController lastNameController =
      TextEditingController();

  static final TextEditingController passwordController =
      TextEditingController();

  static final TextEditingController phoneNumberController =
      TextEditingController();

  static final TextEditingController userNameController =
      TextEditingController();
}

class DesignationScreenTextEditingControllers {
//  static String selectedDesignation = "";
//  static set selectedDesignationSet(String id){
//   selectedDesignation = id;
//  }
//  static String selectedDepartment = "";
//  static set selectedDepartmentSet(String departmentName){
//   selectedDepartment = departmentName;
//  }

  // static DepartmentModel? departmentData;

  // static final TextEditingController designationController =
  //     TextEditingController();

  // static set selectedDepartment(DepartmentModel data) {
  //   departmentData = data;
  // }
}

class AllEmployeesControllers {}
