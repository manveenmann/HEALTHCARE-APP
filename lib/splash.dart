import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_app/Model/user_model.dart';
import 'package:project_app/Utils/util.dart';
import 'package:project_app/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        _navigateTo("/register", delay: 3);
      } else {
        print('User is signed in! Fetching user details...');
        Util.UID = user.uid;

        FirebaseFirestore.instance
            .collection("users")
            .doc(Util.UID)
            .get()
            .then((DocumentSnapshot doc) {
          if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            Util.user = UserModel.fromMap(data,doc.id); // ✅ Pass Firestore data to `fromMap()`
            Util.checkUserRole(); // ✅ Debugging Role
            _navigateTo("/home", delay: 2);
          } else {
            print("⚠️ User document not found in Firestore.");
            _navigateTo("/register", delay: 2);
          }
        }).catchError((e) {
          print("❌ Error getting user document: $e");
          _navigateTo("/register", delay: 2);
        });
      }
    });
  }

  void _navigateTo(String route, {int delay = 3}) {
    Future.delayed(Duration(seconds: delay), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
