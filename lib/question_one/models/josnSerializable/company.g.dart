// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      isActive: Company._intToBool((json['isActive'] as num?)?.toInt()),
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      established: json['established'] == null
          ? null
          : DateTime.parse(json['established'] as String),
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'isActive': Company._boolToInt(instance.isActive),
      'name': instance.name,
      'address': instance.address?.toJson(),
      'established': instance.established?.toIso8601String(),
      'departments': instance.departments?.map((e) => e.toJson()).toList(),
    };
