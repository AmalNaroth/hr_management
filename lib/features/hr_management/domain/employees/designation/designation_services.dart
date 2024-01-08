import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_model/designation_model.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';

abstract class DesignationService{
  Future<DataState> addDbToDesignation(
       DesignationModel designationData,);

  Future<DataState<List<DesignationEntity>>> getDesignationDataInDB();
}
