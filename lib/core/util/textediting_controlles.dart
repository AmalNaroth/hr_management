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

class DesignationControllers {
  static TextEditingController designationControllers = TextEditingController();
}


class DepartmentControllers {
  static TextEditingController departmentController = TextEditingController();
}
