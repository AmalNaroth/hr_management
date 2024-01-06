import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_add/models/new_employee_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewEmployeeAddServices)
class NewEmployeeAddRepository implements NewEmployeeAddServices{

  //Either<NewEmployeeModel, MainFailure>
  @override
  Future<void> newEmployeesDataAddToFirebase(NewEmployeeModel value) async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
    db.collection("New Employees").add(value.toMap());
    } catch (e) {
      
    }
  }

}