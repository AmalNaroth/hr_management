part of 'holiday_bloc.dart';

sealed class HolidayEvent extends Equatable {
  const HolidayEvent();

  @override
  List<Object> get props => [];
}

final class HolidayInitialEvent extends HolidayEvent{
  @override
  List<Object> get props => [];
}

final class HolidaySubmitButtonClickEvent extends HolidayEvent {
  HolidayModel holidayData;
  HolidaySubmitButtonClickEvent({
    required this.holidayData
  });
  @override
  List<Object> get props => [holidayData];
}