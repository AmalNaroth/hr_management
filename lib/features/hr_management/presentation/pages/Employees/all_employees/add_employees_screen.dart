import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/widgets/department_select_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/widgets/designation_select_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/widgets/image_select_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_calander_widget01.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_textformfield_02.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';
import 'package:uuid/uuid.dart';

class AddNewEmployeeScreen extends StatelessWidget {
  const AddNewEmployeeScreen({super.key});

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
                  key: AddNewEmployeeTextEditingControlls.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      fHight30,
                      CustomTextWidget01(
                          textValue: "Add Employee",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      fHight20,
                      ImagePickerWidget(),
                      fHight10,
                      EmployeeTextFormField(
                          fieldController: AddNewEmployeeTextEditingControlls
                              .firstNameController,
                          fieldName: "First Name"),
                      EmployeeTextFormField(
                          fieldController: AddNewEmployeeTextEditingControlls
                              .lastNameController,
                          fieldName: "Last Name"),
                      EmployeeTextFormField(
                          fieldController: AddNewEmployeeTextEditingControlls
                              .userNameController,
                          fieldName: "User Name"),
                      EmployeeTextFormField(
                          fieldController: AddNewEmployeeTextEditingControlls
                              .emailController,
                          fieldName: "Email"),
                      EmployeeTextFormField(
                          fieldController: AddNewEmployeeTextEditingControlls
                              .passwordController,
                          fieldName: "Password"),
                      EmployeeTextFormField(
                          fieldController: AddNewEmployeeTextEditingControlls
                              .conformPasswordController,
                          fieldName: "Confirm Password"),
                      EmployeeTextFormField(
                          fieldController:
                              AddNewEmployeeTextEditingControlls.employeeId,
                          fieldName: "Employee ID"),
                      EmployeeTextFormField(
                          fieldController: AddNewEmployeeTextEditingControlls
                              .phoneNumberController,
                          fieldName: "Phone"),
                      CustomCalenderFormField(
                          fieldTitle: "Joining Date",
                          joiningDate: AddNewEmployeeTextEditingControlls
                              .joiningDateController),
                      fHight10,
                      DepartmentDropDownButton(
                          listItems: const [],
                          title: "Department",
                          hintText: "Selected Department"),
                      fHight10,
                      const DesignationDropDownButton(
                          listItems: [],
                          title: "Designation",
                          hintText: "Selected Department"),
                      ElevatedButton(
                        onPressed: () {
                          if (AddNewEmployeeTextEditingControlls
                              .formKey.currentState!
                              .validate()) {
                            submittButtonClicked();
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
                )),
          ),
        ),
      ),
    );
  }

  Future<void> submittButtonClicked() async {}
  Future<String> uplodImageStorage(Uint8List file) async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    Reference ref = _storage.ref().child("userImages").child(const Uuid().v1());
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
