part of 'dash_board_bloc.dart';

sealed class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object> get props => [];
}

final class DashboardSuccessState extends DashBoardState {
  int employeeCount;
  int designationCount;
  int departmentCount;
  DashboardSuccessState(
      {required this.departmentCount,
      required this.designationCount,
      required this.employeeCount});
}

final class DashBoardInitialState extends DashboardSuccessState {
  DashBoardInitialState()
      : super(departmentCount: 0, designationCount: 0, employeeCount: 0);
}

final class DashboardLoadingState extends DashBoardState {}

final class DashboardErrorState extends DashBoardState {}
