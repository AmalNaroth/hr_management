import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_model/department_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_services.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DepartmentServices)
class DepartmentRepository implements DepartmentServices {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<DataState> addDepartmentToDB(DepartmentModel data) async {
    try {
      final _value = await db.collection("Department").doc(data.id).set(
            data.toJson(),
          );
      return DataSuccess("New departmnet added success");
    } catch (err) {
      return DataFailed(err as FirebaseException);
    }
  }

  @override
  Future<DataState<List<DepartmentEntity>>> getDepartmentDataInDB() async {
    try {
      final result = await db.collection("Department").get();
      final List<DepartmentModel> desgination = result.docs
          .map(
            (e) => DepartmentModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return DataSuccess(desgination);
    } catch (err) {
      return DataFailed(err as FirebaseException);
    }
  }
}
