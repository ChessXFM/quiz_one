
import 'package:intl/intl.dart';


// mixins :
mixin jsonHelperMixin<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}

mixin BoolToInt on jsonHelperMixin {
  int boolToInt(bool value) => value ? 1 : 0;
  bool intToBool(int value) => value == 1;
}

// helper methods :
 String formatEstablishedDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat('d-MMM, yyyy', 'en_US').format(date.toUtc());
  }


// classes :
class Company with jsonHelperMixin, BoolToInt {
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

  @override
  Company fromJson(Map<String, dynamic> json) {
    return Company(
      isActive: intToBool(json['is_active']),
      name: json['name'],
      address: json.containsKey('address')
          ? Address().fromJson(json['address'])
          : null,
      established: DateTime.parse(json['established']),
      departments: json.containsKey('departments')
          ? List<Department>.from(
              json['departments'].map((x) => Department().fromJson(x)))
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'is_active': boolToInt(isActive!),
      'name': name,
     'established': established!.toUtc().toIso8601String(),
    };

    if (address != null) {
      json['address'] = address!.toJson();
    }
    if (departments != null) {
      json['departments'] =
          List<dynamic>.from(departments!.map((x) => x.toJson()));
    } 

    return json;
  }

    
}

class Address with jsonHelperMixin<Address> {
  String? street;
  String? city;
  String? state;
  String? postalCode;

  Address({
    this.street,
    this.city,
    this.state,
    this.postalCode,
  });

  @override
  Address fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        city: json['city'],
        state: json['state'],
        postalCode: json['postalCode'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'state': state,
        'postalCode': postalCode,
      };
}

class Department with jsonHelperMixin<Department> {
  String? depId;
  String? name;
  String? manager;
  double? budget;
  int? year;
  Availability? availability;
  String? meetingTime;

  Department(
      {this.depId,
      this.availability,
      this.budget,
      this.manager,
      this.meetingTime,
      this.name,
      this.year});
  @override
  Department fromJson(Map<String, dynamic> json) => Department(
      depId: json["depId"],
      availability: Availability().fromJson(json['availability']),
      budget: json["budget"],
      manager: json["manager"],
      meetingTime: json["meetingTime"],
      name: json["name"]);
  @override
  Map<String, dynamic> toJson() {
    return {
      "depId": depId,
      "availability": availability!.toJson(),
      "budget": budget,
      "manager": manager,
      "meetingTime": meetingTime,
      "name": name
    };
  }
}

class Availability with jsonHelperMixin<Availability> {
  bool? online;
  bool? inStore;

  Availability({
    this.online,
    this.inStore,
  });

  @override
  Availability fromJson(Map<String, dynamic> json) => Availability(
        online: json['online'],
        inStore: json['inStore'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'online': online,
        'inStore': inStore,
      };
}
