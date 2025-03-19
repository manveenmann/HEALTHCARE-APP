import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/Model/user_model.dart';


class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register User
  Future<UserModel?> registerUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String age,
    required String gender,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        name: name,
        email: email,
        role: role,
        age: age,
        gender: gender,
        createdAt: DateTime.now(),
      );

      await _firestore.collection("users").doc(user.uid).set(user.toMap());

      return user;
    } catch (e) {
      print("Error registering user: $e");
      return null;
    }
  }

  // Get User Details
  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection("users").doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
    } catch (e) {
      print("Error fetching user: $e");
    }
    return null;
  }

  // Update User Details (Optional)
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _firestore.collection("users").doc(uid).update(data);
  }
}

