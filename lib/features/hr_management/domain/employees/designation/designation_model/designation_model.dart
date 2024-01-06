import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';
import 'package:uuid/uuid.dart';

class DesignationModel extends DesignationEntity {
  final String id;
  final String name;
  final String department;

  DesignationModel({required this.id, required this.name,required this.department})
      : super(name: name, id: id,department: department);

  factory DesignationModel.generate({required String designationName,required String department}) {
    final String id = const Uuid().v1();
    return DesignationModel(id: id, name: designationName,department: department);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'department' : department
    };
  }

  factory DesignationModel.fromJson(Map<String, dynamic> json) {
    return DesignationModel(
      id: json['id'],
      name: json['name'],
      department : json['department']
    );
  }

  @override
  List<Object?> get props => [id, name,department];
}
