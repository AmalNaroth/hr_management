import 'package:equatable/equatable.dart';

class HolidayEntity extends Equatable {
  String id;
  String holidayTitle;
  String holiday;
  String holidayData;
  HolidayEntity({
    required this.id,
    required this.holiday,
    required this.holidayData,
    required this.holidayTitle,
  });

  @override
  List<Object?> get props => [holidayTitle, holiday, holidayData];
}
