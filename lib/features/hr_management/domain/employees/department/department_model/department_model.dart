import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class DepartmentModel extends  DepartmentEntity{
  String id;
  String name;

  DepartmentModel({required this.id, required this.name})
      : super(name: name, id: id);

  factory DepartmentModel.generate({required String departmentName}) {
    final String id = const Uuid().v1();
    return DepartmentModel(id: id, name: departmentName);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
