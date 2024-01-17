import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_services.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_services.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_services.dart';
import 'package:injectable/injectable.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

@injectable
class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc(
    NewEmployeeAddServices employeeInstance,
    DepartmentServices departmentInstance,
    DesignationService designationInstance,
  ) : super(DashBoardInitialState()) {
    on<DashboardInitialEvent>((event, emit) async {
      emit(
        DashboardLoadingState(),
      );
      final employeeResult = await employeeInstance.getDataFromDB();
      final departmentResult = await departmentInstance.getDepartmentDataInDB();
      final designationResult =
          await designationInstance.getDesignationDataInDB();

      if (employeeResult is DataSuccess &&
          departmentResult is DataSuccess &&
          designationResult is DataSuccess) {
        emit(
          DashboardSuccessState(
              departmentCount: employeeResult.data?.length ?? 0,
              designationCount: designationResult.data?.length ?? 0,
              employeeCount: designationResult.data?.length ?? 0),
        );
      } else {
        emit(
          DashboardErrorState(),
        );
      }
    });
  }
}
