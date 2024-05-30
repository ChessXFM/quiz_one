
class Address {
  String street;
  String city;
  String state;
  String postalCode;

  Address({required this.street, required this.city, required this.state, required this.postalCode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
    );
  }
}

mixin Availability {
  bool? online;
  bool? inStore;
}

class Department with Availability {
  String deptId;
  String name;
  String manager;
  double budget;
  int year;
  String meetingTime;

  Department({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    required this.year,
    required this.meetingTime,
      online,
      inStore,
  }) ;

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      deptId: json['deptId'],
      name: json['name'],
      manager: json['manager'],
      budget: json['budget'].toDouble(),
      year: json['year'],
      meetingTime: json['meeting_time'],
      online: json['availability']['online'],
      inStore: json['availability']['inStore'],
    );
  }
}

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

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      isActive: json['is_active'],
      name: json['name'],
      address: Address.fromJson(json['address']),
      established: DateTime.parse(json['established']),
      departments: (json['departments'] as List).map((dept) => Department.fromJson(dept)).toList(),
    );
  }
}
