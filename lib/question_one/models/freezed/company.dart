// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';
import 'department.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  factory Company({
    @JsonKey(name: 'is_active') bool? isActive,
    String? name,
    Address? address,
    DateTime? established,
    List<Department>? departments,
  }) = _Company;
  
  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
