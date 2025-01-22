// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class PasswordResetPage extends StatefulWidget {
//   const PasswordResetPage({Key? key}) : super(key: key);

//   @override
//   _PasswordResetPageState createState() => _PasswordResetPageState();
// }

// class _PasswordResetPageState extends State<PasswordResetPage> {
//   final TextEditingController _emailController = TextEditingController();

//   Future<void> _resetPassword() async {
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(
//         email: _emailController.text.trim(),
//       );
//       print("Password reset email sent.");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Password reset email sent.")),
//       );
//     } catch (e) {
//       print("Error sending password reset email: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Reset Password"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: "Email Address",
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _resetPassword,
//               child: const Text("Send Reset Link"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
