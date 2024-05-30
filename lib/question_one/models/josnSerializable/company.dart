import 'package:json_annotation/json_annotation.dart';
import 'address.dart';
import 'department.dart';


part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  @JsonKey(toJson: _boolToInt,fromJson: _intToBool, )
  bool? isActive;
  String? name;
  Address? address;
  DateTime? established;
  List<Department>? departments;

  Company({
    this.isActive,
    this.name,
    this.address,
    this.established,
    this.departments,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

   // Accommodate for nullable bool to int conversion
  static int? _boolToInt(bool? val) => val == true ? 1 : 0;

  // Accommodate for nullable int to bool conversion
  static bool? _intToBool(int? val) => val == 1;
}
