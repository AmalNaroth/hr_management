part of 'department_bloc.dart';

sealed class DepartmentEvent extends Equatable {
  const DepartmentEvent();
  @override
  List<Object> get props => [];
}

class DepartmentInitialEvent extends DepartmentEvent {}

final class NewDepartmentEvent extends DepartmentEvent {
  String departmentName;
  NewDepartmentEvent({required this.departmentName});
}
