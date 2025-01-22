// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> register() async {
//     String name = _nameController.text.trim();
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);

//         // Store user data in Firestore
//         await FirebaseFirestore.instance
//             .collection("users")
//             .doc(userCredential.user!.uid)
//             .set({
//           'name': name,
//           'email': email,
//           'createdAt': DateTime.now(),
//         });

//         print("User registered successfully!");
//         Navigator.pushReplacementNamed(context, "/login");
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'email-already-in-use') {
//           print('The email is already in use.');
//         } else if (e.code == 'weak-password') {
//           print('The password is too weak.');
//         } else {
//           print('Error: ${e.message}');
//         }
//       } catch (e) {
//         print('An unexpected error occurred: $e');
//       }
//     } else {
//       print("Please fill in all fields.");
//     }
//   }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_app/theme/app_colors.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> register() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Store user data in Firestore
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'createdAt': DateTime.now(),
        });

        print("User registered successfully!");
        Navigator.pushReplacementNamed(context, "/login");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          print('The email is already in use.');
        } else if (e.code == 'weak-password') {
          print('The password is too weak.');
        } else {
          print('Error: ${e.message}');
        }
      } catch (e) {
        print('An unexpected error occurred: $e');
      }
    } else {
      print("Please fill in all fields.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Title
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Centered Image
              Center(
                child: Image.asset(
                  'assets/images/women-insulin.png', // Replace with your image
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              // Name Input Field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Email Input Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password Input Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Sign Up Button
              ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
