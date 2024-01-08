part of 'designation_bloc.dart';

sealed class DesignationEvent extends Equatable {
  const DesignationEvent();

  @override
  List<Object> get props => [];
}

class DesignationInitialEvent extends DesignationEvent {}

class DesignationSubmitEvent extends DesignationEvent {
  String departmnetName;
  String designationName;
  DesignationSubmitEvent(
      {required this.departmnetName, required this.designationName});
}
