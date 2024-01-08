import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';
import 'package:uuid/uuid.dart';

class EmployeeIDTextFormField extends StatefulWidget {
  const EmployeeIDTextFormField({Key? key}) : super(key: key);

  @override
  State<EmployeeIDTextFormField> createState() => _EmployeeIDTextFormFieldState();
}

class _EmployeeIDTextFormFieldState extends State<EmployeeIDTextFormField> {

  void generateAutoId() {
    setState(() {
      EmployeesControlls.employeeId.text = const Uuid().v1();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget01(
          textValue: "Employee ID",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter the value";
            }
            return null;
          },
          controller: EmployeesControlls.employeeId,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: generateAutoId,
              icon: const Icon(Icons.autorenew),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
