import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/holiday/holiday_model.dart';

abstract class HolidayServices{
  Future<DataState> addNewHolidayDb({required HolidayModel data});
  Future<DataState> getHolidayDataDb();
}