import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  // Attributes
  String fullName; 
  String email; 
  String phoneNumber; 
  String password; 
  String gender; 
  int age; 
 

  // Constructor
  AppUser({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.age,
   
  });

  // Static method to return an empty AppUser object
  static AppUser getAppUserEmptyObject() {
    return AppUser(
      fullName: "",
      email: "",
      phoneNumber: "",
      password: "",
      gender: "Select Gender",
      age: 0,
    
    );
  }

  // toMap function for Firestore or other databases
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'gender': gender,
      'age': age,
    
    };
  }

  // fromMap factory method to create an AppUser from Firestore data
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      fullName: map['fullName'] ?? "",
      email: map['email'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      password: map['password'] ?? "",
      gender: map['gender'] ?? "",
      age: map['age'] ?? 0,
      
    );
  }
}
