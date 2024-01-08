part of 'employees_bloc.dart';

sealed class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

final class EmployeesInitialState extends EmployeesState {
  Map<String, List<String>> departmentMap;
  List<NewEmployeeModelEntity> employeeListData;
  EmployeesInitialState(
      {required this.departmentMap, required this.employeeListData});
}

final class EmployeesNewSubmit extends EmployeesState {}

final class EmployeesSuccessState extends EmployeesState {
  String successMessage;
  EmployeesSuccessState({
    required this.successMessage,
  });
}

final class EmployeeErrorState extends EmployeesState {
  String errorMessage;
  EmployeeErrorState({
    required this.errorMessage,
  });
}
