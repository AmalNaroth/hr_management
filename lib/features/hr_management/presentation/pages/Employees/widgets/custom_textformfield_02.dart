import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class EmployeeTextFormField extends StatelessWidget {
  String fieldName;
  TextEditingController fieldController;
  EmployeeTextFormField({
    super.key,
    required this.fieldController,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget01(
            textValue: fieldName, fontSize: 16, fontWeight: FontWeight.bold),
        fHight10,
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter the value";
            }
            return null;
          },
          controller: fieldController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
        fHight20
      ],
    );
  }
}
