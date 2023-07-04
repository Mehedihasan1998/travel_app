import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? password;
  final String? dateOfBirth;

  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.phone,
    required this.dateOfBirth,
    required this.email,
    required this.password
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Phone": phone,
      "Gender": gender,
      "Birth": dateOfBirth,
      "Email": email,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot <Map<String, dynamic>>document){
    final data = document.data();
    return UserModel(
        id: document.id,
        firstName: data!["FirstName"],
        lastName: data!["LastName"],
        gender: data!["Gender"],
        phone: data!["Phone"],
        dateOfBirth: data!["Birth"],
        email: data!["Email"],
        password: data!["Password"],
    );
  }
}