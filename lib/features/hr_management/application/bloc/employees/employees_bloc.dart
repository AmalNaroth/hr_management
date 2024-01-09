import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_add/models/new_employee_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/all_employees/new_employee_services.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/designation/designation_services.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/new_employee_model.dart';
import 'package:injectable/injectable.dart';

part 'employees_event.dart';
part 'employees_state.dart';

@injectable
class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesBloc(
    DesignationService designationIntance,
    NewEmployeeAddServices employeeInstance,
  ) : super(
          EmployeesInitialState(
              departmentMap: const {}, employeeListData: const []),
        ) {
    on<EmployeesInitlaEvent>(
      (event, emit) async {
        Map<String, List<String>> departmentMap = {};
        final result = await designationIntance.getDesignationDataInDB();
        final getResult = await employeeInstance.getDataFromDB();

        if (result is DataSuccess && getResult is DataSuccess) {
          for (DesignationEntity item in result.data!) {
            String department = item.department;
            String designation = item.name;
            departmentMap.putIfAbsent(department, () => []);

            if (!departmentMap[department]!.contains(designation)) {
              departmentMap[department]!.add(designation);
            }
          }
          emit(
            EmployeesInitialState(
                departmentMap: departmentMap, employeeListData: getResult.data),
          );
        } else {
          print(result.error);
          print(getResult.error);
        }
      },
    );
    on<EmployeesNewSubmitEvent>(
      (event, emit) async {
        final imageUrl =
            await uplodImageStorage(event.imageData, event.newEmployeeData.id);
        final uuid = await employeeInstance.newUserAuth(event.newEmployeeData.userEmail, event.newEmployeeData.userPassword);        
        final instance = NewEmployeeModel(
            id: uuid.data,
            firstName: event.newEmployeeData.firstName,
            lastName: event.newEmployeeData.lastName,
            userName: event.newEmployeeData.userName,
            userEmail: event.newEmployeeData.userEmail,
            userPassword: event.newEmployeeData.userPassword,
            employeeId: event.newEmployeeData.employeeId,
            joinDate: event.newEmployeeData.joinDate,
            department: event.newEmployeeData.department,
            designation: event.newEmployeeData.designation,
            imageFile: imageUrl);
        final reponse = await employeeInstance.newEmployeeAdd(instance);

        Map<String, List<String>> departmentMap = {};
        final result = await designationIntance.getDesignationDataInDB();
        final getResult = await employeeInstance.getDataFromDB();

        if (result is DataSuccess &&
            getResult is DataSuccess &&
            reponse is DataSuccess &&
            uuid is DataSuccess) {
          for (DesignationEntity item in result.data!) {
            String department = item.department;
            String designation = item.name;
            departmentMap.putIfAbsent(department, () => []);

            if (!departmentMap[department]!.contains(designation)) {
              departmentMap[department]!.add(designation);
            }
          }
          emit(
            EmployeesSuccessState(successMessage: reponse.data),
          );
          emit(
            EmployeesInitialState(
                departmentMap: departmentMap, employeeListData: getResult.data),
          );
        } else {}
      },
    );
  }
}

Future<String> uplodImageStorage(Uint8List file, String uuid) async {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Reference ref = _storage.ref().child("userImages").child(uuid);
  UploadTask uploadTask = ref.putData(file);
  TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
}
