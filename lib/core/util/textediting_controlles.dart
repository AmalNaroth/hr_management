import 'package:flutter/material.dart';

class EmployeesControlls {
  static final TextEditingController conformPasswordController =
      TextEditingController();

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController employeeId = TextEditingController();
  static final TextEditingController firstNameController =
      TextEditingController();

  static final formKey = GlobalKey<FormState>();
  static String joiningDateController = "";
  set joiningDateControllerSet(String value) {
    joiningDateController = value;
  }

  static final TextEditingController lastNameController =
      TextEditingController();

  static String newSelectedDepartment = "";
  static String newSelectedDesignation = "";
  static final TextEditingController passwordController =
      TextEditingController();

  static final TextEditingController phoneNumberController =
      TextEditingController();

  static final TextEditingController userNameController =
      TextEditingController();

  static set newSelectedDepartmentSet(String value) {
    newSelectedDepartment = value;
  }

  static set newSelectedDesignationSet(String value) {
    newSelectedDesignation = value;
  }

  static TextEditingController seachEmployeeController = TextEditingController();
}

class DesignationControllers {
  static String? departmentController;
  static TextEditingController designationControllers = TextEditingController();

  static set departmentControllerSet(String data) {
    departmentController = data;
  }
}

class DepartmentControllers {
  static TextEditingController departmentController = TextEditingController();
}

class HolidayControllers {
  static TextEditingController titleController = TextEditingController();
  static String? holidayDate;
  set holidayDateSet(String value) {
    holidayDate = value;
  }

  static String? holiday;
  set holidaySet(String value) {
    holidayDate = value;
  }
}
