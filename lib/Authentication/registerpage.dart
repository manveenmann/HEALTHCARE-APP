// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization
// import 'package:project_app/theme/app_colors.dart';
// import 'package:project_app/l10n/app_en.arb';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   String? _selectedRole;
//   String _selectedLanguage = 'en'; // Default language

//   Future<void> register() async {
//     String name = _nameController.text.trim();
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//     String age = _ageController.text.trim();
//     String gender = _genderController.text.trim();

//     if (name.isEmpty || email.isEmpty || password.isEmpty || _selectedRole == null) {
//       print("Please fill in all fields and select a role.");
//       return;
//     }

//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);

//       // Store user data and role in Firestore
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(userCredential.user!.uid)
//           .set({
//         'name': name,
//         'email': email,
//         'role': _selectedRole,
//         'age': age,
//         'gender': gender,
//         'createdAt': DateTime.now(),
//       });

//       print("User registered successfully!");
//       Navigator.pushReplacementNamed(context, "/login");
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'email-already-in-use') {
//         print('The email is already in use.');
//       } else if (e.code == 'weak-password') {
//         print('The password is too weak.');
//       } else {
//         print('Error: ${e.message}');
//       }
//     } catch (e) {
//       print('An unexpected error occurred: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context)!;

//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               // Language Dropdown
//               DropdownButton<String>(
//                 value: _selectedLanguage,
//                 items: [
//                   DropdownMenuItem(
//                     value: 'en',
//                     child: Text('English'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'hi',
//                     child: Text('हिंदी'),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedLanguage = value!;
//                     AppLocalizations.delegate.load(Locale(_selectedLanguage));
//                   });
//                 },
//               ),
//               const SizedBox(height: 20),
//               // Title
//               Text(
//                 localizations.signUp,
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     localizations.alreadyHaveAcc,
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, "/login");
//                     },
//                     child: Text(
//                       localizations.logIn,
//                       style: const TextStyle(
//                         color: AppColors.secondaryColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               // Centered Image
//               Center(
//                 child: Image.asset(
//                   'assets/images/women-insulin.png', // Replace with your image
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               // Name Input Field
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: localizations.nameHint,
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.person,
//                     color: AppColors.primaryColor,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Age Input Field
//               TextField(
//                 controller: _ageController,
//                 decoration: InputDecoration(
//                   labelText: localizations.ageHint,
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.cake,
//                     color: AppColors.primaryColor,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Gender Input Field
//               TextField(
//                 controller: _genderController,
//                 decoration: InputDecoration(
//                   labelText: localizations.genderHint,
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.person_outline,
//                     color: AppColors.primaryColor,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Email Input Field
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: localizations.emailHint,
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.email,
//                     color: AppColors.primaryColor,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Password Input Field
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: localizations.passwordHint,
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.lock,
//                     color: AppColors.primaryColor,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Role Dropdown
//               DropdownButtonFormField<String>(
//                 value: _selectedRole,
//                 items: ["Patient", "Doctor", "Admin"]
//                     .map((role) => DropdownMenuItem(
//                           value: role,
//                           child: Text(role),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedRole = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: localizations.roleHint,
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.person_outline,
//                     color: AppColors.primaryColor,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 validator: (value) => value == null ? "Please select a role" : null,
//               ),
//               const SizedBox(height: 32),
//               // Sign Up Button
//               ElevatedButton(
//                 onPressed: register,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primaryColor,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 80, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   localizations.btnSignUp,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//  Purpose of the Page
// The RegisterPage allows users to:

// Register with Firebase Authentication using their email and password.
// Store additional user information (like name, role, age, and gender) in the Firestore database.
// Choose a role (e.g., Patient, Doctor, Admin) and language (e.g., English or Hindi).
// Navigate to the Login page if they already have an account.

// When the "Sign Up" button is clicked, the app:

// Collects input data from the fields.
//  Registers the user using FirebaseAuth.createUserWithEmailAndPassword.
// Stores additional user details (like name, age, gender, role) in the Firestore database.

//  Workflow of Registration
// User Fills Form:

// Inputs name, email, password, age, gender, and selects a role.
// Can also switch language if needed.
// Validation:

// Ensures no fields are left empty.
// Validates that a role is selected.
// Firebase Operations:

// Registers the user with Firebase Authentication.
// Saves additional data in Firestore.
// Redirect:

// On success, redirects the user to the Login page.
// On failure, displays error messages.




import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_app/language_provider.dart';
import 'package:project_app/theme/app_colors.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  String? _selectedRole;

  Future<void> register() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String age = _ageController.text.trim();
    String gender = _genderController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || _selectedRole == null) {
      print("Please fill in all fields and select a role.");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'role': _selectedRole,
        'age': age,
        'gender': gender,
        'createdAt': DateTime.now(),
      });

      print("User registered successfully!");
      Navigator.pushReplacementNamed(context, "/login");
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
    } catch (e) {
      print('An unexpected error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
       backgroundColor: AppColors.backgroundColor,
     actions: [
  DropdownMenu(
    initialSelection: context.watch<LanguageProvider>().selectedLocale.languageCode,
    onSelected: (value) {
     context.read<LanguageProvider>().changeLanguage(value as String);

    },
    dropdownMenuEntries: LanguageProvider.languages.map((language) {
      return DropdownMenuEntry(
        value: language['locale'],
        label: language['name'],
      );
    }).toList(),
  ),
],

      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(localizations.signUp, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(localizations.alreadyHaveAcc, style: const TextStyle(fontSize: 14)),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, "/login"),
                  child: Text(localizations.logIn, style: const TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.bold)),
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
            const SizedBox(height: 24),
            _buildTextField(_nameController, localizations.nameHint, Icons.person),
            _buildTextField(_ageController, localizations.ageHint, Icons.cake),
            _buildTextField(_genderController, localizations.genderHint, Icons.person_outline),
            _buildTextField(_emailController, localizations.emailHint, Icons.email),
            _buildTextField(_passwordController, localizations.passwordHint, Icons.lock, obscureText: true),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              items: ["Patient", "Doctor", "Admin"].map((role) => DropdownMenuItem(value: role, child: Text(role))).toList(),
              onChanged: (value) => setState(() => _selectedRole = value),
              decoration: InputDecoration(
                labelText: localizations.roleHint,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.person_outline, color: AppColors.primaryColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(localizations.btnSignUp, style: const TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
