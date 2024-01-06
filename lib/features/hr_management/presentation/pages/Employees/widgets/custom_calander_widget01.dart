import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';
import 'package:intl/intl.dart';

class CustomCalenderFormField extends StatefulWidget {
  String fieldTitle;
  String? joiningDate;
  CustomCalenderFormField({super.key,
  required this.fieldTitle,
   this.joiningDate});

  bool isValidate = false;

  DateTime? selectedDateTime;

  @override
  State<CustomCalenderFormField> createState() =>
      _CustomCalenderFormFieldState();
}

class _CustomCalenderFormFieldState extends State<CustomCalenderFormField> {

 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget01(
            textValue: widget.fieldTitle,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        fHight10,
        Container(
          padding: const EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: widget.isValidate ? Colors.red : Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget01(
                  textValue: widget.selectedDateTime == null
                      ? ""
                      : DateFormat("dd MMM yyyy").format(widget.selectedDateTime!),),
              IconButton(
                onPressed: () async {
                  widget.selectedDateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025),
                  );
                  if (widget.selectedDateTime == null) {
                    return;
                  }
                  setState(() {
                    widget.isValidate = false;
                    widget.joiningDate = DateFormat("dd MMM yyyy").format(widget.selectedDateTime!);
                  });
                },
                icon: Icon(Icons.calendar_month_outlined),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
          child: Visibility(
            visible: widget.isValidate,
            child: CustomTextWidget01(textValue: "Enter the date",fontColors: Color.fromARGB(255, 181, 25, 13),
            fontSize: 12),
          ),
        )
      ],
    );
  }
}
