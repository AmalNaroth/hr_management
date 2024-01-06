part of 'department_bloc.dart';

sealed class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

final class DepartmentInitialState extends DepartmentState {
  String message;
  List<DepartmentEntity> departmentData;
  DepartmentInitialState({required this.departmentData,required this.message});
  @override
  List<Object> get props => [this.departmentData];
}

final class DepartmentLoadingState extends DepartmentState {}

final class DepartmentErrorState extends DepartmentState {
  String message;
  DepartmentErrorState({required this.message});
}

final class DepartmentSuccessState extends DepartmentState {
  String message;
  List<DepartmentEntity> departmentData;
  DepartmentSuccessState({required this.message,required this.departmentData});
  @override
  List<Object> get props => [this.departmentData];
}
