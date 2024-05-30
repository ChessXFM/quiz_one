// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'availability.dart';

part 'department.freezed.dart';
part 'department.g.dart';

@freezed
class Department with _$Department {
  factory Department({
    @JsonKey(name: 'deptId') String? deptId,
    String? name,
    String? manager,
    double? budget,
    int? year,
    Availability? availability,
    @JsonKey(name: 'meeting_time') String? meetingTime,
  }) = _Department;
  
  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
}
