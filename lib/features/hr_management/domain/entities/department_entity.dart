import 'package:equatable/equatable.dart';

class DepartmentEntity extends Equatable {
  String id;
  String name;

  DepartmentEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [this.id, this.name];
}
