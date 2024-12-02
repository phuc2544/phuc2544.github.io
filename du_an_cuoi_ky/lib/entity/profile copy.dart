class Profile {
  late String firstName;
  late String lastName;
  late String maidenName;
  late int age;
  late String phone;

  Profile(
      {required this.firstName,
      required this.lastName,
      required this.maidenName,
      required this.age,
      required this.phone});

  // Phương thức để chuyển JSON sang object Profile
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      phone: json['phone'],
    );
  }

  // Phương thức để chuyển object Profile thành JSON
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'phone': phone,
    };
  }
}
