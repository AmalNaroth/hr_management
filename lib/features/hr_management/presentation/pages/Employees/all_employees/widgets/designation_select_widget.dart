import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class DesignationDropDownButton extends StatelessWidget {
  final List listItems;
  final String title;
  final String hintText;
  const DesignationDropDownButton(
      {super.key,
      required this.listItems,
      required this.title,
      required this.hintText,});

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
          items:[],
          //  listItems.map((e) {
          //   return DropdownMenuItem(
          //     child: Text(e.name),
          //     value: e,
          //   );
          // }).toList(),
          onChanged: (value) {

          },
        ),
        fHight20,
      ],
    );
  }
}
