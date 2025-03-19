class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;
  final String age;
  final String gender;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    required this.age,
    required this.gender,
    required this.createdAt,
  });

  // Convert object to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
      'age': age,
      'gender': gender,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Convert Firebase document snapshot to UserModel
  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      uid: documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      role: data['role'] ?? 'Patient', // Default role is Patient
      age: data['age'] ?? '',
      gender: data['gender'] ?? '',
      createdAt: DateTime.parse(data['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
