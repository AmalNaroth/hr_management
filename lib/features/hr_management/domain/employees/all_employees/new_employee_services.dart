//Either<NewEmployeeModel,MainFailure>
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_add/models/new_employee_model.dart';

abstract class NewEmployeeAddServices {
  Future<DataState> newEmployeeAdd(NewEmployeeModel value);

  Future<DataState> getDataFromDB();

  Future<DataState> newUserAuth(String userEmail,String userPassword);
}
