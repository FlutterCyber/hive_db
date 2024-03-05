class User {
  String? firstName;
  String? lastName;
  String? email;
  int? age;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
  });

  User.fromJson(Map<String, dynamic> map)
      : firstName = map['firstName'],
        lastName = map['lastName'],
        email = map['email'],
        age = map['age'];

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'age': age,
      };
}
