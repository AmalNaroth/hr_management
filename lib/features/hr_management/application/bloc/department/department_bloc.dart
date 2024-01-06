import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_model/department_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_services.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';
import 'package:injectable/injectable.dart';

part 'department_event.dart';
part 'department_state.dart';

@injectable
class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc(DepartmentServices departmentInstance)
      : super(DepartmentInitialState(departmentData: const [],message: "")) {
    on<DepartmentInitialEvent>(
      (event, emit) async {
        emit(
          DepartmentLoadingState(),
        );
        final result = await departmentInstance.getDepartmentDataInDB();

        if (result is DataSuccess) {
          emit(DepartmentInitialState(departmentData: result.data,message: ""));
        } else {
          emit(
            DepartmentErrorState(
              message: result.error.toString(),
            ),
          );
        }
      },
    );

    on<NewDepartmentEvent>(
      (event, emit) async {
        emit(
          DepartmentLoadingState(),
        );
        final instanceData =
            DepartmentModel.generate(departmentName: event.departmentName);
        final addResult =
            await departmentInstance.addDepartmentToDB(instanceData);
        final getResult = await departmentInstance.getDepartmentDataInDB();

        if (addResult is DataSuccess && getResult is DataSuccess) {
          emit(
            DepartmentSuccessState(
              message: addResult.data,
              departmentData: getResult.data,
            ),
          );
        } else {
          emit(
            DepartmentErrorState(
              message: addResult.error.toString(),
            ),
          );
        }
      },
    );
  }
}
