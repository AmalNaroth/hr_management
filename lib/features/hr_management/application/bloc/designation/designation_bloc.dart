import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/department/department_services.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_model/designation_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_services.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';
import 'package:injectable/injectable.dart';

part 'designation_event.dart';
part 'designation_state.dart';

@injectable
class DesignationBloc extends Bloc<DesignationEvent, DesignationState> {
  DesignationBloc(DesignationService designationInstance,
      DepartmentServices departmentInstance)
      : super(
          DesignationInitialState(
            departmentData: [],
            designationData: [],
          ),
        ) {
    on<DesignationInitialEvent>((event, emit) async {
      emit(
        DesignationLoadingState(),
      );
      final getDesignationResult =
          await designationInstance.getDesignationDataInDB();
      final getDepartmentResult =
          await departmentInstance.getDepartmentDataInDB();
    
      if (getDesignationResult is DataSuccess &&
          getDepartmentResult is DataSuccess) {
            
        emit(
          DesignationInitialState(
              departmentData: getDepartmentResult.data,
              designationData: getDesignationResult.data ?? [],
              ),
        );
      } else {
        
        emit(
          DesignationErrorState(
            message: getDesignationResult.error.toString(),
          ),
        );
      }
    },
    );



    on<DesignationSubmitEvent>(
      (event, emit) async {
        emit(
          DesignationLoadingState(),
        );
        final instanceData = DesignationModel.generate(
            designationName: event.designationName,
            department: event.departmnetName);
        final getDesignationResult =
            await designationInstance.getDesignationDataInDB();
        final getDepartmentResult =
            await departmentInstance.getDepartmentDataInDB();
        final addDesignationData =
            await designationInstance.addDbToDesignation(instanceData);
        if (getDesignationResult is DataSuccess &&
            getDepartmentResult is DataSuccess &&
            addDesignationData is DataSuccess) {
          emit(
            DesignationSuccessState(
                message: addDesignationData.data,
                departmentData: getDepartmentResult.data,
                designationData: getDesignationResult.data ?? []),
          );
        } else {
          emit(
            DesignationErrorState(
              message: addDesignationData.error.toString(),
            ),
          );
        }
      },
    );
  }
}
