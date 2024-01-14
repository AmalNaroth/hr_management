part of 'holiday_bloc.dart';

abstract class HolidayState extends Equatable {
  const HolidayState();

  @override
  List<Object> get props => [];
}

class HolidayInitialState extends HolidayState {
  final List<HolidayEntity> holidayData;

  HolidayInitialState({
    this.holidayData = const [],
  });
}

class HolidayLoadingState extends HolidayState {}

class HolidayErrorState extends HolidayState {}

class NewHolidaySubmitState extends HolidayState {
  String message;
  NewHolidaySubmitState({required this.message});
}
