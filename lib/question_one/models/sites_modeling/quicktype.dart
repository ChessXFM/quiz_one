// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
    int isActive;
    String name;
    Address address;
    DateTime established;
    List<Department> departments;

    Company({
        required this.isActive,
        required this.name,
        required this.address,
        required this.established,
        required this.departments,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        isActive: json["is_active"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        established: DateTime.parse(json["established"]),
        departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "is_active": isActive,
        "name": name,
        "address": address.toJson(),
        "established": established.toIso8601String(),
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
    };
}
////////////////////////////////////

class Address {
    String street;
    String city;
    String state;
    String postalCode;

    Address({
        required this.street,
        required this.city,
        required this.state,
        required this.postalCode,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "postalCode": postalCode,
    };
}
/////////////////////////////////
class Department {
    String deptId;
    String name;
    String manager;
    int budget;
    int? year;
    Availability? availability;
    String meetingTime;

    Department({
        required this.deptId,
        required this.name,
        required this.manager,
        required this.budget,
        this.year,
        this.availability,
        required this.meetingTime,
    });

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        deptId: json["deptId"],
        name: json["name"],
        manager: json["manager"],
        budget: json["budget"],
        year: json["year"],
        availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
        meetingTime: json["meeting_time"],
    );

    Map<String, dynamic> toJson() => {
        "deptId": deptId,
        "name": name,
        "manager": manager,
        "budget": budget,
        "year": year,
        "availability": availability?.toJson(),
        "meeting_time": meetingTime,
    };
}

class Availability {
    bool online;
    bool inStore;

    Availability({
        required this.online,
        required this.inStore,
    });

    factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        online: json["online"],
        inStore: json["inStore"],
    );

    Map<String, dynamic> toJson() => {
        "online": online,
        "inStore": inStore,
    };
}
