import 'package:hr_management_new/features/hr_management/domain/entities/holiday_entity.dart';
import 'package:uuid/uuid.dart';

class HolidayModel extends HolidayEntity {
  String id;
  String holidayTitle;
  String holiday;
  String holidayData;

  HolidayModel({
    required this.id,
    required this.holiday,
    required this.holidayData,
    required this.holidayTitle,
  }) : super(
          id: id,
          holiday: holiday,
          holidayData: holidayData,
          holidayTitle: holidayTitle,
        );

  factory HolidayModel.generate({
    required String holiday,
    required String holidayData,
    required String holidayTitle,
  }) {
    final id = const Uuid().v1();
    return HolidayModel(
      id: id,
      holiday: holiday,
      holidayData: holidayData,
      holidayTitle: holidayTitle,
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'holiday': holiday,
      'holidayData': holidayData,
      'holidayTitle': holidayTitle
    };
  }

  factory HolidayModel.fromJson(Map<String, dynamic> json) {
    return HolidayModel(
      id: json['id'] ??
          const Uuid().v1(), // Generate UUID if not provided in JSON
      holiday: json['holiday'],
      holidayData: json['holidayData'],
      holidayTitle: json['holidayTitle'],
    );
  }
}
