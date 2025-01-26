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
      print("User Details: $user");
      if (user == null) {
        print('User is currently signed out!');
        Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pushReplacementNamed("/register");
        });
      } else {
        print('User is signed in!');
        Util.UID = user.uid;
        Timer(const Duration(seconds: 10), () {
          final docRef =
              FirebaseFirestore.instance.collection("users").doc(Util.UID);
          docRef.get().then(
            (DocumentSnapshot doc) {
              final data = doc.data() as Map<String, dynamic>;
              Util.user = AppUser.fromMap(data);
              Navigator.of(context).pushReplacementNamed("/home");
            },
            onError: (e) => print("Error getting document: $e"),
          );
        });
      }
    });

    Timer(const Duration(seconds: 10), () {
    

      Navigator.of(context).pushReplacementNamed("/register");
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:AppColors.backgroundColor,
      body: Center(
       
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}