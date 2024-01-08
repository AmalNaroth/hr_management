import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';
import 'package:intl/intl.dart';

class CustomCalenderFormField extends StatefulWidget {
  final String fieldTitle;
  bool isValidate = false;
  DateTime? selectedDateTime;

  CustomCalenderFormField({Key? key, required this.fieldTitle,})
      : super(key: key);

  @override
  State<CustomCalenderFormField> createState() =>
      _CustomCalenderFormFieldState();
}

class _CustomCalenderFormFieldState extends State<CustomCalenderFormField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget01(
            textValue: widget.fieldTitle,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          fHight10,
          Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.isValidate ? Colors.red : Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget01(
                  textValue: widget.selectedDateTime == null
                      ? ""
                      : DateFormat("dd MMM yyyy").format(widget.selectedDateTime!),
                ),
                IconButton(
                  onPressed: () async {
                    _selectDate(context);
                  },
                  icon: Icon(Icons.calendar_month_outlined),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Visibility(
              visible: widget.isValidate,
              child: CustomTextWidget01(
                textValue: "Enter the date",
                fontColors: Color.fromARGB(255, 181, 25, 13),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != widget.selectedDateTime) {
      setState(() {
        widget.isValidate = false;
        widget.selectedDateTime = pickedDate;
        EmployeesControlls.joiningDateController = DateFormat("dd MMM yyyy").format(pickedDate);
      });
    }
  }
}
