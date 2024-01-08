import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/designation/designation_bloc.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_dropdown_button01.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_textformfield_02.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class AddDesignationBottomSheetWidget extends StatelessWidget {
  final List<DepartmentEntity> departmentData;
  const AddDesignationBottomSheetWidget(
      {super.key, required this.departmentData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          fHight20,
          CustomDropDownButton01(
            listItems: departmentData,
            title: "Department",
            hintText: "Select department",
          ),
          EmployeeTextFormField(
              fieldController: DesignationControllers.designationControllers,
              fieldName: "Add Designation"),
          fHight30,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              fixedSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              context.read<DesignationBloc>().add(
                    DesignationSubmitEvent(
                      departmnetName:
                          DesignationControllers.departmentController ??
                              "No department added",
                      designationName: DesignationControllers
                          .designationControllers.text
                          .trim(),
                    ),
                  );
            },
            child: CustomTextWidget01(
                textValue: "Submit",
                fontSize: 17,
                fontColors: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
