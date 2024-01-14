import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/holiday/holiday_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/holiday/holiday_services.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/holiday_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HolidayServices)
class HolidayRepository extends HolidayServices {
  @override
  Future<DataState> addNewHolidayDb({required HolidayModel data}) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection("Holidays")
          .doc(data.id)
          .set(
            data.toJson(),
          );
      return DataSuccess("New holiday added");
    } catch (e) {
      return DataFailed(e as FirebaseException);
    }
  }

  @override
  Future<DataState<List<HolidayEntity>>> getHolidayDataDb() async {
    try {
      final result =
          await FirebaseFirestore.instance.collection("Holidays").get();
      final List<HolidayModel> data = result.docs
          .map(
            (e) => HolidayModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return DataSuccess(data);
    } catch (e) {
      return DataFailed(e as FirebaseException);
    }
  }
}
