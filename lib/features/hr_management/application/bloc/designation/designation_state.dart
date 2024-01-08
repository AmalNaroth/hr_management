part of 'designation_bloc.dart';

sealed class DesignationState extends Equatable {
  const DesignationState();
  @override
  List<Object> get props => [];
}

final class DesignationInitialState extends DesignationState {
  List<DesignationEntity> designationData;
  List<DepartmentEntity> departmentData;
  DesignationInitialState({
    required this.designationData,
    required this.departmentData,
  });
  @override
  List<Object> get props => [this.departmentData, this.designationData];
}

final class DesignationLoadingState extends DesignationState {}

final class DesignationSuccessState extends DesignationState {
  String message;
  List<DesignationEntity> designationData;
  List<DepartmentEntity> departmentData;
  DesignationSuccessState({
    required this.message,
    required this.designationData,
    required this.departmentData,
  });
  @override
  List<Object> get props => [this.departmentData, this.designationData];
}

final class DesignationErrorState extends DesignationState {
  String message;
  DesignationErrorState({required this.message});
}
