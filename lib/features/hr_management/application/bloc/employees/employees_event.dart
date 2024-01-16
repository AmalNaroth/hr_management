part of 'employees_bloc.dart';

sealed class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

final class EmployeesInitlaEvent extends EmployeesEvent {}

final class EmployeesNewSubmitEvent extends EmployeesEvent {
  NewEmployeeModel newEmployeeData;
  Uint8List imageData;
  EmployeesNewSubmitEvent(
      {required this.newEmployeeData, required this.imageData});
}

final class EmployeesSearchEvent extends EmployeesEvent {
  String employeeName;
  EmployeesSearchEvent({required this.employeeName});
}
