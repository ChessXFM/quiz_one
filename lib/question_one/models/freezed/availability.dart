import 'package:freezed_annotation/freezed_annotation.dart';

part 'availability.freezed.dart';
part 'availability.g.dart';

@freezed
class Availability with _$Availability {
  factory Availability({
    bool? online,
    bool? inStore,
  }) = _Availability;
  
  factory Availability.fromJson(Map<String, dynamic> json) => _$AvailabilityFromJson(json);
}
