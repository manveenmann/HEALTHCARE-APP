
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/theme/app_colors.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      print("Password reset email sent.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent.")),
      );
    } catch (e) {
      print("Error sending password reset email: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Background color
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: AppColors.primaryColor, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              "Reset Your Password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email Address",
                filled: true,
               // fillColor: AppColors.inputFieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Enter your registered email",
              //  hintStyle: TextStyle(color: AppColors.hintTextColor),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Send Reset Link",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back to Login",
                style: TextStyle(color: AppColors.secondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Features of the Password Reset Page:
// Email Input Field:

// A TextField widget is provided for users to enter their registered email address.
// Input is trimmed to avoid trailing or leading spaces (_emailController.text.trim()).
// Reset Password Functionality:

// On clicking the "Send Reset Link" button, the _resetPassword function sends a password reset email to the entered email address using FirebaseAuth.instance.sendPasswordResetEmail.
// Both success and error cases are handled with SnackBar notifications to inform the user.
// Back to Login:

// A "Back to Login" button allows users to navigate back to the login screen.
// Styling:

// AppColors is used for consistent styling across the app. For example:
// AppColors.primaryColor: Main color for the AppBar and button.
// AppColors.secondaryColor: Used for the "Back to Login" text button.
// AppColors.backgroundColor: Background color for the screen.
// Input fields have rounded corners with a clean, modern look.
// User Experience Enhancements:

// Padding around widgets ensures proper spacing for readability and touch comfort.
// The "Send Reset Link" button has a large touch target and vibrant colors to grab attention.
// The TextField includes a placeholder (hintText) and supports email input (keyboardType: TextInputType.emailAddress) for better UX.
// Error Handling:

// Errors during the password reset process (e.g., invalid email) are caught and displayed to the user using SnackBar.