// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:project_app/theme/app_colors.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isNotEmpty && password.isNotEmpty) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);

//         // Fetch the user's role from Firestore
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection("users")
//             .doc(userCredential.user!.uid)
//             .get();

//         String role = userDoc['role'];
//         showSnackBar("Logged in successfully as $role!");

//         // Navigate based on the role
//         if (role == "Doctor") {
//           Navigator.pushReplacementNamed(context, "/doctorHome");
//         } else {
//           Navigator.pushReplacementNamed(context, "/patientHome");
//         }
//       } on FirebaseAuthException catch (e) {
//         showSnackBar(_getErrorMessage(e.code));
//       } catch (e) {
//         showSnackBar("An unexpected error occurred. Please try again.");
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } else {
//       showSnackBar("Please fill in both fields.");
//     }
//   }

//   String _getErrorMessage(String errorCode) {
//     switch (errorCode) {
//       case 'user-not-found':
//         return 'No user found for this email.';
//       case 'wrong-password':
//         return 'Incorrect password. Please try again.';
//       default:
//         return 'An error occurred. Please try again later.';
//     }
//   }

//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 50),
//               const Text(
//                 "Sign In",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                 Text(
//                   //  "Don't have an account?",
//                   localizations.dontHaveAcc,
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, "/register");
//                     },
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         color: AppColors.secondaryColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: Image.asset(
//                   'assets/images/man-insulin.png',
//                   height: 300,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'youremail@gmail.com',
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
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
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
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, "/reset");
//                 },
//                 child: const Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "Forgot Password?",
//                     style: TextStyle(
//                       color: AppColors.secondaryColor,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               _isLoading
//                   ? const CircularProgressIndicator(
//                       color: AppColors.primaryColor,
//                     )
//                   : ElevatedButton(
//                       onPressed: login,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryColor,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 80, vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//               const SizedBox(height: 16),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, "/phoneAuth");
//                 },
//                 child: const Text(
//                   "Sign in using Phone Number",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.secondaryColor,
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


// 1. The Purpose of the Page
// The login page allows users to securely log into their accounts using their email and password. Based on their role (e.g., Doctor or Patient), they are taken to their respective sections in the app.

// 2. How the Login Works
// The user enters their email address and password in two separate fields.
// If the user clicks "Sign In", the app checks if the entered email and password are correct:
// It sends this information to a secure system called Firebase (a tool that manages users and their data securely).
// Firebase checks if this email/password combination exists in the database.
// If it matches, the app identifies whether the user is a Doctor or a Patient by looking up their profile stored in another system called Firestore.
// Depending on their role:
// Doctors are sent to the Doctor's Dashboard.
// Patients are sent to the Patient's Dashboard.
// 3. Error Messages and Feedback
// If something goes wrong, the app shows a helpful message:

// Incorrect Password? The app will say, "Incorrect password. Please try again."
// No Account Found? It says, "No user found for this email."
// If there's a general issue, it simply asks the user to try again later.
// 4. Forgot Password or Create New Account
// There are additional options:

// If someone forgets their password, they can click "Forgot Password?" to reset it.
// If they don’t have an account yet, they can click "Sign Up" to create a new one.
// 5. Additional Features
// Sign in with Phone Number: Users can choose to log in using their phone number if they prefer that over email.
// Loading Indicator: While the app is verifying the email and password, it shows a spinning icon so the user knows something is happening.
// Image and Design:
// There’s a friendly image of a person with medical tools, making the page feel relatable.
// The design uses clean colors like teal and white to give a professional and calm vibe.
// 6. Behind the Scenes
// To make this experience seamless:

// The app uses Firebase to handle sign-ins securely.
// Firestore is used to store and retrieve user details, like whether someone is a Doctor or Patient.
// The app uses various checks to ensure all information is entered correctly before trying to log in.
// 7. Why This Page is Important
// This login system ensures:

// Only authorized users can access their personalized dashboards.
// Users feel confident that their data is handled securely.
// The app can cater to different types of users (e.g., Doctors and Patients) with unique experiences for each.
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_app/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:project_app/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .get();

        String role = userDoc['role'];
        showSnackBar("Logged in successfully as $role!");

        if (role == "Doctor") {
          Navigator.pushReplacementNamed(context, "/doctorHome");
        } else {
          Navigator.pushReplacementNamed(context, "/patientHome");
        }
      } on FirebaseAuthException catch (e) {
        showSnackBar(_getErrorMessage(e.code));
      } catch (e) {
        showSnackBar("An unexpected error occurred. Please try again.");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      showSnackBar("Please fill in both fields.");
    }
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found for this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      default:
        return 'An error occurred. Please try again later.';
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
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
            const SizedBox(height: 50),
            Text(localizations.signIn, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(localizations.dontHaveAcc, style: const TextStyle(fontSize: 14)),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, "/register"),
                  child: Text(localizations.signUp, style: const TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/images/man-insulin.png',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(_emailController, localizations.emailHint, Icons.email),
            _buildTextField(_passwordController, localizations.passwordHint, Icons.lock, obscureText: true),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/reset"),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(localizations.forgotPass, style: const TextStyle(color: AppColors.secondaryColor, fontSize: 14)),
              ),
            ),
            const SizedBox(height: 32),
            _isLoading
                ? const CircularProgressIndicator(color: AppColors.primaryColor)
                : ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(localizations.signIn, style: const TextStyle(fontSize: 16, color: Colors.white)),
                  ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "/phoneAuth"),
              child: Text(localizations.signInPhone, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryColor)),
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

