part of 'dash_board_bloc.dart';

sealed class DashBoardEvent extends Equatable {
  const DashBoardEvent();

  @override
  List<Object> get props => [];
}

final class DashboardInitialEvent extends DashBoardEvent{
  
}
