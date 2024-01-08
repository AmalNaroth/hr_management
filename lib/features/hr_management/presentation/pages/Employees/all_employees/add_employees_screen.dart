import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/employees/employees_bloc.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_add/models/new_employee_model.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/widgets/department_select_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/widgets/employee_id.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/widgets/image_select_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_calander_widget01.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_textformfield_02.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class AddNewEmployeeScreen extends StatelessWidget {
  const AddNewEmployeeScreen({super.key, required this.departmentMap});

  final Map<String, List<String>> departmentMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: mHight! - 23,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: EmployeesControlls.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    fHight30,
                    CustomTextWidget01(
                        textValue: "Add Employee",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    fHight20,
                    const ImagePickerWidget(),
                    fHight10,
                    EmployeeTextFormField(
                        fieldController: EmployeesControlls.firstNameController,
                        fieldName: "First Name"),
                    EmployeeTextFormField(
                        fieldController: EmployeesControlls.lastNameController,
                        fieldName: "Last Name"),
                    EmployeeTextFormField(
                        fieldController: EmployeesControlls.userNameController,
                        fieldName: "User Name"),
                    EmployeeTextFormField(
                        fieldController: EmployeesControlls.emailController,
                        fieldName: "Email"),
                    EmployeeTextFormField(
                        fieldController: EmployeesControlls.passwordController,
                        fieldName: "Password"),
                    EmployeeTextFormField(
                        fieldController:
                            EmployeesControlls.conformPasswordController,
                        fieldName: "Confirm Password"),
                    const EmployeeIDTextFormField(),
                    EmployeeTextFormField(
                        fieldController:
                            EmployeesControlls.phoneNumberController,
                        fieldName: "Phone"),
                    CustomCalenderFormField(
                        fieldTitle: "Joining Date",),
                    fHight10,
                    DepartmentDesignationDropDownButton(
                        departmentMap: departmentMap),
                    fHight10,
                    ElevatedButton(
                      onPressed: () async {
                        if (EmployeesControlls.formKey.currentState!
                            .validate()) {
                          context.read<EmployeesBloc>().add(
                                EmployeesNewSubmitEvent(
                                  newEmployeeData: NewEmployeeModel.generate(
                                    firstName: EmployeesControlls
                                        .firstNameController.text
                                        .trim(),
                                    lastName: EmployeesControlls
                                        .lastNameController.text
                                        .trim(),
                                    userName: EmployeesControlls
                                        .userNameController.text
                                        .trim(),
                                    userEmail: EmployeesControlls
                                        .emailController.text
                                        .trim(),
                                    userPassword: EmployeesControlls
                                        .passwordController.text
                                        .trim(),
                                    joinDate: EmployeesControlls
                                        .joiningDateController
                                        .toString(),
                                    department: EmployeesControlls
                                        .newSelectedDepartment,
                                    designation: EmployeesControlls
                                        .newSelectedDesignation,
                                    employeeId: EmployeesControlls
                                        .employeeId.text
                                        .trim(),
                                  ),
                                  imageData: await selectImage(),
                                ),
                              );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget01(
                              textValue: "Submit",
                              fontColors: Colors.white,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
