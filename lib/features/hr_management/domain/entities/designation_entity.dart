import 'package:equatable/equatable.dart';

class DesignationEntity extends Equatable {
  String id;
  String name;
  String department;
  DesignationEntity(
      {required this.id, required this.name, required this.department});
  @override
  List<Object?> get props => [this.id,this.name,this.department];
}
