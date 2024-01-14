import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/holiday/holiday_bloc.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/holiday/holiday_model.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/holidays/holiday_calender_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_textformfield_02.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class AddHolidayBottomSheet extends StatelessWidget {
  const AddHolidayBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EmployeeTextFormField(
                fieldController: HolidayControllers.titleController,
                fieldName: "Holiday Title"),
            HolidayCalender(fieldTitle: "Date"),
            fHight30,
            ElevatedButton(
              onPressed: () {
                final instnace = HolidayModel.generate(
                  holiday: HolidayControllers.holiday ?? "",
                  holidayData: HolidayControllers.holidayDate ?? "",
                  holidayTitle: HolidayControllers.titleController.text.trim(),
                );
                context.read<HolidayBloc>().add(
                      HolidaySubmitButtonClickEvent(holidayData: instnace),
                    );
              },
              child: CustomTextWidget01(
                  textValue: "Submit",
                  fontColors: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
