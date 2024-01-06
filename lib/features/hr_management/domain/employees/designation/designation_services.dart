import 'package:dartz/dartz.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_model/department_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_model/designation_model.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';

abstract class DesignationService{
  Future<Either<String, String>> addDbToDesignation(
       DesignationModel designationData,
      DepartmentModel departmentData,);

  Future<Either<String,List<DesignationEntity>>> getDesignationDataInDB();
}
