// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:project_app/Authentication/loginpage.dart';
// import 'package:project_app/Authentication/registerpage.dart';
// import 'package:project_app/Authentication/phone_auth_page.dart';
// import 'package:project_app/Authentication/password_reset_page.dart';
// import 'package:project_app/Home/doc.dart';
// import 'package:project_app/Home/patient.dart';
// import 'theme/app_theme.dart';
// import 'firebase_options.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
  
//     return MaterialApp(
//       supportedLocales:const [
//         Locale('en'),
//          Locale('hi'),
//       ] ,
//       locale:Locale('en') ,
//       localizationsDelegates:[
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate

//       ] ,
//       debugShowCheckedModeBanner: false,
   
      
//       initialRoute: "/register",
//       routes: {
//         "/register": (context) => const RegisterPage(),
//         "/login": (context) => const LoginPage(),
//         "/phoneAuth": (context) => const PhoneAuthPage(),
//         "/reset": (context) => const PasswordResetPage(),
//         "/patientHome": (context) => const patientHome(),
//         "/doctorHome": (context) => const doctorHome(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Corrected import
import 'package:project_app/Anthropometric/bmichart.dart';
import 'package:project_app/Authentication/loginpage.dart';
import 'package:project_app/Authentication/registerpage.dart';
import 'package:project_app/Authentication/phone_auth_page.dart';
import 'package:project_app/Authentication/password_reset_page.dart';
import 'package:project_app/Home/doc.dart';
import 'package:project_app/Home/patient.dart';
import 'package:project_app/splash.dart';
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
      supportedLocales: const [
        Locale('en'), // English
        Locale('hi'), // Hindi
      ],
      locale: const Locale('en'), // Default locale
      localizationsDelegates: const [
        AppLocalizations.delegate, // Generated localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const Splash(),
        "/register": (context) => const RegisterPage(),
        "/login": (context) => const LoginPage(),
        "/phoneAuth": (context) => const PhoneAuthPage(),
        "/reset": (context) => const PasswordResetPage(),
        "/patientHome": (context) => const PatientHome(),
        "/doctorHome": (context) => const doctorHome(),
        "/bmichart": (context) => BMIChart(),
      },
    );
  }
}
