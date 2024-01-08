// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class NewEmployeeModelEntity extends Equatable {
  NewEmployeeModelEntity(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.userEmail,
      required this.userPassword,
      required this.employeeId,
      required this.joinDate,
      required this.department,
      required this.designation,
      required this.imageFile,
      required this.id});

  String department;
  String designation;
  String employeeId;
  String firstName;
  String id;
  String imageFile;
  String joinDate;
  String lastName;
  String userEmail;
  String userName;
  String userPassword;

  @override
  List<Object?> get props => [
        this.id,
        this.firstName,
        this.lastName,
        this.userName,
        this.userEmail,
        this.userPassword,
        this.employeeId,
        this.joinDate,
        this.department,
        this.designation,
        this.imageFile
      ];
}
