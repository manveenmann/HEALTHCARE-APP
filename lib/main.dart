import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_app/Authentication/loginpage.dart';
import 'package:project_app/Authentication/registerpage.dart';
import 'package:project_app/Authentication/phone_auth_page.dart';
import 'package:project_app/Authentication/password_reset_page.dart';
import 'theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/register",
      routes: {
        "/register": (context) => const RegisterPage(),
       "/login": (context) => const LoginPage(),
        "/phoneAuth": (context) => const PhoneAuthPage(),
        "/reset": (context) => const PasswordResetPage(),
      },
    );
  }
}
