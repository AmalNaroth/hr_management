import 'package:hr_management_new/features/hr_management/domain/entities/new_employee_model.dart';

class NewEmployeeModel extends NewEmployeeModelEntity {
  NewEmployeeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.employeeId,
    required this.joinDate,
    required this.department,
    required this.designation,
    required this.imageFile,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            userName: userName,
            userEmail: userEmail,
            userPassword: userPassword,
            employeeId: employeeId,
            joinDate: joinDate,
            department: department,
            designation: designation,
            imageFile: imageFile);

  factory NewEmployeeModel.fromMap(Map<String, dynamic> map) {
    return NewEmployeeModel(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
      userPassword: map['userPassword'] as String,
      employeeId: map['employeeId'] as String,
      joinDate: map['joinDate'] as String,
      department: map['department'] as String,
      designation: map['designation'] as String,
      imageFile: map['imageFile'] as String,
    );
  }

  factory NewEmployeeModel.generate({
    required String firstName,
    required String lastName,
    required String userName,
    required String userEmail,
    required String userPassword,
    required String employeeId,
    required String joinDate,
    required String department,
    required String designation,
    String? imageFile,
  }) {
    return NewEmployeeModel(
      id: employeeId,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      userEmail: userEmail,
      userPassword: userPassword,
      employeeId: employeeId,
      joinDate: joinDate,
      department: department,
      designation: designation,
      imageFile: imageFile ?? "",
    );
  }

  String department;
  String designation;
  String employeeId;
  String firstName;
  String id;
  String imageFile;
  String joinDate; // Use DateTime for dates
  String lastName;
  String userEmail;
  String userName;
  String userPassword;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        userName,
        userEmail,
        userPassword,
        employeeId,
        joinDate,
        department,
        designation,
        imageFile
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'employeeId': employeeId,
      'joinDate': joinDate, // Convert DateTime to String
      'department': department,
      'designation': designation,
      'imageFile': imageFile,
    };
  }
}
