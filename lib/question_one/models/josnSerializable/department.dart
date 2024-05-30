
/////////
///
///
import 'package:json_annotation/json_annotation.dart';
import 'availability.dart';

part 'department.g.dart';

@JsonSerializable(explicitToJson: true)
class Department {
  String? depId;
  String? name;
  String? manager;
  double? budget;
  int? year;
  Availability? availability;
  String? meetingTime;

  Department({
    this.depId,
    this.name,
    this.manager,
    this.budget,
    this.year,
    this.availability,
    this.meetingTime,
  });

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
