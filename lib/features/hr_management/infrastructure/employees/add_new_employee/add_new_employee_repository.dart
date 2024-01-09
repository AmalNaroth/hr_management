import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_add/models/new_employee_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewEmployeeAddServices)
class NewEmployeeAddRepository implements NewEmployeeAddServices {
  @override
  Future<DataState> newEmployeeAdd(NewEmployeeModel value) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      db.collection("New Employees").doc(value.id).set(
            value.toMap(),
          );
      return const DataSuccess("New employee added");
    } catch (err) {
      return DataFailed(err as FirebaseException);
    }
  }

  @override
  Future<DataState> getDataFromDB() async {
    try {
      final data =
          await FirebaseFirestore.instance.collection("New Employees").get();
      final List<NewEmployeeModel> instance = data.docs
          .map(
            (e) => NewEmployeeModel.fromMap(
              e.data(),
            ),
          )
          .toList();
      return DataSuccess(instance);
    } catch (e) {
      return DataFailed(e as FirebaseException);
    }
  }

  @override
  Future<DataState> newUserAuth(String userEmail, String userPassword) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      return DataSuccess(response.user!.uid);
    } catch (err) {
      return DataFailed(err as FirebaseException);
    }
  }
}
