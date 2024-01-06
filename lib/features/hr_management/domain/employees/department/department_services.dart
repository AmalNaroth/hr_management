import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_model/department_model.dart';

abstract class DepartmentServices{
  Future<DataState> addDepartmentToDB(DepartmentModel data);

  Future<DataState> getDepartmentDataInDB();
}