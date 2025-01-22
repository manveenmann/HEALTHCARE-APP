// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isNotEmpty && password.isNotEmpty) {
//       try {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         print("User successfully logged in!");

//         Navigator.pushReplacementNamed(context, "/home");
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided.');
//         } else {
//           print('Error: ${e.message}');
//         }
//       } catch (e) {
//         print('An unexpected error occurred: $e');
//       }
//     } else {
//       print("Please fill in both fields.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50),
//                 TextField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'E-Mail',
//                     hintText: 'youremail@gmail.com',
//                     prefixIcon: Icon(Icons.email),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.lock),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 ElevatedButton(
//                   onPressed: login,
//                   child: const Text('SIGN IN'),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 40, vertical: 20),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(context, "/register");
//                   },
//                   child: const Text("Don't have an account? Sign up here."),
//                 ),
//                 const SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, "/phoneAuth");
//                   },
//                   child: const Text("Sign in using Phone Number"),
//                 ),
//                  const SizedBox(height: 16),
//                 TextButton(
//               onPressed: () => Navigator.of(context).pushNamed('/reset'),
//               child: const Text("Forgot Password?"),
//             ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/theme/app_colors.dart';
//import 'app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("User successfully logged in!");

        Navigator.pushReplacementNamed(context, "/home");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided.');
        } else {
          print('Error: ${e.message}');
        }
      } catch (e) {
        print('An unexpected error occurred: $e');
      }
    } else {
      print("Please fill in both fields.");
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
                "Sign In",
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
                    "Don't have an account?",
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/register");
                    },
                    child: const Text(
                      "Sign Up",
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
                  'assets/images/man-insulin.png', // Replace with your image
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              // Email Input Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'youremail@gmail.com',
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
                  labelText: 'Password',
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
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/reset");
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Sign In Button
              Center(
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Sign in using Phone Number
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/phoneAuth");
                },
                child: const Text(
                  "Sign in using Phone Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor,
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
