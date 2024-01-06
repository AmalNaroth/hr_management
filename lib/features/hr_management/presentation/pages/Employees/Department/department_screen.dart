import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/department/department_bloc.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/Department/widgets/table_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_snackbar.dart';

class DepartmentScreen extends StatefulWidget {
  DepartmentScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  void initState() {
    context.read<DepartmentBloc>().add(
          DepartmentInitialEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Department Screen'),
      ),
      body: BlocConsumer<DepartmentBloc, DepartmentState>(
        listener: (context, state) {
          if (state is DepartmentSuccessState) {
            customSnackBar(state.message, context);
            NavigatorService.goBack();
            DepartmentControllers.departmentController.clear();
          }
        },
        builder: (context, state) {
          if (state is DepartmentLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DepartmentErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is DepartmentInitialState) {
            return DepartmentTableWidget(data: state.departmentData);
          } else if (state is DepartmentSuccessState) {
            return DepartmentTableWidget(data: state.departmentData);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
