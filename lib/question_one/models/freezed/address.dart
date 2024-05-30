import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    String? street,
    String? city,
    String? state,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'postalCode') String? postalCode,
  }) = _Address;
  
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
