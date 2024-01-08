import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class DepartmentDesignationDropDownButton extends StatefulWidget {
  DepartmentDesignationDropDownButton({super.key, required this.departmentMap});

  Map<String, List<String>> departmentMap;

  @override
  State<DepartmentDesignationDropDownButton> createState() =>
      _DepartmentDesignationDropDownButtonState();
}

class _DepartmentDesignationDropDownButtonState
    extends State<DepartmentDesignationDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget01(
            textValue: "Department", fontSize: 16, fontWeight: FontWeight.bold),
        fHight10,
        DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return "Select the type";
            }
            return null;
          },
          hint: Text("Select Department"),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: widget.departmentMap.keys.map((String department) {
            return DropdownMenuItem<String>(
              value: department,
              child: Text(department),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(
              () {
                EmployeesControlls.newSelectedDepartmentSet = newValue!;
                // Reset selected designation when department changes
                EmployeesControlls.newSelectedDesignationSet = "";
              },
            );
          },
        ),
        fHight20,
        CustomTextWidget01(
            textValue: "Designation",
            fontSize: 16,
            fontWeight: FontWeight.bold),
        fHight10,
        DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return "Select the type";
            }
            return null;
          },
          hint: Text("Select Designation"),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: (widget.departmentMap[
                      EmployeesControlls.newSelectedDepartment] ??
                  [])
              .map(
            (String designation) {
              return DropdownMenuItem<String>(
                value: designation,
                child: Text(designation),
              );
            },
          ).toList(),
          onChanged: (String? newValue) {
            setState(
              () {
                EmployeesControlls.newSelectedDesignationSet = newValue!;
              },
            );
          },
        ),
        fHight20,
      ],
    );
  }
}
