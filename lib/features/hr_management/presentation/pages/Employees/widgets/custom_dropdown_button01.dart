import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class CustomDropDownButton01 extends StatelessWidget {
  final List<DepartmentEntity> listItems;
  final String title;
  final String hintText;
  const CustomDropDownButton01({
    super.key,
    required this.listItems,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget01(
            textValue: title, fontSize: 16, fontWeight: FontWeight.bold),
        fHight10,
        DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return "Select the type";
            }
            return null;
          },
          hint: Text(hintText),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: listItems.map((e) {
            return DropdownMenuItem(
              child: Text(e.name),
              value: e.name,
            );
          }).toList(),
          onChanged: (value) {
            DesignationControllers.departmentControllerSet = value ?? "";
          },
        ),
        fHight20,
      ],
    );
  }
}
