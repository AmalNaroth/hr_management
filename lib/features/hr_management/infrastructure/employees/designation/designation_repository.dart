import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_model/department_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_model/designation_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_services.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DesignationService)
class DesignationRepository extends DesignationService {
  @override
  Future<DataState> addDbToDesignation(
      DesignationModel designationData) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      // final result = await db
      //     .collection("Department")
      //     .doc(departmentData.id)
      //     .collection("Designation")
      //     .doc(designationData.id)
      //     .set(
      //       designationData.toJson(),
      //     );
      await db.collection("Designation").doc(designationData.id).set(
            designationData.toJson(),
          );
      return DataSuccess("New designation added");
    } catch (err) {
      return DataFailed(err as FirebaseException);
    }
  }

  @override
  Future<DataState<List<DesignationEntity>>> getDesignationDataInDB() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final result = await db.collection("Designation").get();
      final List<DesignationModel> desgination = result.docs
          .map(
            (e) => DesignationModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return DataSuccess(desgination);
    } catch (e) {
      return DataFailed(e as FirebaseException);
    }
  }
}
