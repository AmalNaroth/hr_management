import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/designation/designation_bloc.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/Designations/widgets/designation_table_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_snackbar.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class DesignationScreen extends StatefulWidget {
  const DesignationScreen({Key? key}) : super(key: key);

  @override
  State<DesignationScreen> createState() => _DesignationScreenState();
}

class _DesignationScreenState extends State<DesignationScreen> {
  @override
  void initState() {
    context.read<DesignationBloc>().add(
          DesignationInitialEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<DesignationBloc, DesignationState>(
        listener: (context, state) {
          if (state is DesignationSuccessState) {
            customSnackBar(state.message, context);
            NavigatorService.goBack();
            DesignationControllers.departmentControllerSet = "";
            DesignationControllers.designationControllers.clear();
          }
        },
        builder: (context, state) {
          if (state is DesignationLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DesignationSuccessState) {
            return DesignationTableWidget(
              departmentData: state.departmentData,
              designationData: state.designationData,
            );
          } else if (state is DesignationErrorState) {
            return Center(
              child: CustomTextWidget01(textValue: state.message),
            );
          } else if (state is DesignationInitialState) {
            return DesignationTableWidget(
                departmentData: state.departmentData,
                designationData: state.designationData);
          } else {
            return Container();
          }
        },
      ),
      //drawer: const DrawerCardWidget(),
    );
  }
}
