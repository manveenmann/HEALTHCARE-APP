// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class PhoneAuthPage extends StatefulWidget {
//   const PhoneAuthPage({Key? key}) : super(key: key);

//   @override
//   _PhoneAuthPageState createState() => _PhoneAuthPageState();
// }

// class _PhoneAuthPageState extends State<PhoneAuthPage> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//   String? _verificationId;

//   Future<void> _verifyPhoneNumber() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: _phoneController.text.trim(),
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         print("Phone number automatically verified and user signed in: $credential");
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print("Phone number verification failed. Code: ${e.code}. Message: ${e.message}");
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         print("Verification code sent to the phone.");
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         print("Verification code auto-retrieval timeout.");
//       },
//     );
//   }

//   Future<void> _signInWithOtp() async {
//     if (_verificationId != null) {
//       try {
//         final credential = PhoneAuthProvider.credential(
//           verificationId: _verificationId!,
//           smsCode: _otpController.text.trim(),
//         );
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         print("Phone number verified and user signed in: $credential");
//       } catch (e) {
//         print("Error signing in with OTP: $e");
//       }
//     } else {
//       print("Verification ID is null. Verify phone number first.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Phone Authentication"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _phoneController,
//               decoration: const InputDecoration(
//                 labelText: "Phone Number",
//                 hintText: "+1234567890",
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _verifyPhoneNumber,
//               child: const Text("Send OTP"),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _otpController,
//               decoration: const InputDecoration(
//                 labelText: "Enter OTP",
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _signInWithOtp,
//               child: const Text("Verify & Sign In"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class PhoneAuthPage extends StatefulWidget {
//   const PhoneAuthPage({Key? key}) : super(key: key);

//   @override
//   _PhoneAuthPageState createState() => _PhoneAuthPageState();
// }

// class _PhoneAuthPageState extends State<PhoneAuthPage> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//   String? _verificationId;

//   Future<void> _verifyPhoneNumber() async {
//     String phoneNumber = _phoneController.text.trim();
    
//     if (!phoneNumber.startsWith("+91")) {
//       phoneNumber = "+91$phoneNumber";
//     }

//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         print("Phone number automatically verified and user signed in: $credential");
//         Navigator.pushReplacementNamed(context, "/home");
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print("Phone number verification failed. Code: ${e.code}. Message: ${e.message}");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Verification failed: ${e.message}")),
//         );
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         print("Verification code sent to the phone.");
//         setState(() {
//           _verificationId = verificationId;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("OTP sent to your phone")),
//         );
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         print("Verification code auto-retrieval timeout.");
//       },
//     );
//   }

//   Future<void> _signInWithOtp() async {
//     if (_verificationId != null) {
//       try {
//         final credential = PhoneAuthProvider.credential(
//           verificationId: _verificationId!,
//           smsCode: _otpController.text.trim(),
//         );
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         print("Phone number verified and user signed in: $credential");
//         Navigator.pushReplacementNamed(context, "/home");
//       } catch (e) {
//         print("Error signing in with OTP: $e");
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Invalid OTP. Please try again.")),
//         );
//       }
//     } else {
//       print("Verification ID is null. Verify phone number first.");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please verify your phone number first.")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Phone Authentication"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: const InputDecoration(
//                 labelText: "Phone Number",
//                 hintText: "Enter 10-digit mobile number",
//                 prefixText: "+91 ",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _verifyPhoneNumber,
//               child: const Text("Send OTP"),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Enter OTP",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _signInWithOtp,
//               child: const Text("Verify & Sign In"),
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


class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String? _verificationId;

  Future<void> _verifyPhoneNumber() async {
    String phoneNumber = _phoneController.text.trim();

    if (!phoneNumber.startsWith("+91")) {
      phoneNumber = "+91$phoneNumber";
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        print(
            "Phone number automatically verified and user signed in: $credential");
        Navigator.pushReplacementNamed(context, "/home");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Phone number verification failed. Code: ${e.code}. Message: ${e.message}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification failed: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        print("Verification code sent to the phone.");
        setState(() {
          _verificationId = verificationId;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP sent to your phone")),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Verification code auto-retrieval timeout.");
      },
    );
  }

  Future<void> _signInWithOtp() async {
    if (_verificationId != null) {
      try {
        final credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: _otpController.text.trim(),
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        print("Phone number verified and user signed in: $credential");
        Navigator.pushReplacementNamed(context, "/home");
      } catch (e) {
        print("Error signing in with OTP: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid OTP. Please try again.")),
        );
      }
    } else {
      print("Verification ID is null. Verify phone number first.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please verify your phone number first.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Background color
      appBar: AppBar(
        title: const Text("Phone Authentication"),
        backgroundColor: AppColors.primaryColor, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              "Verify Your Phone Number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Phone Number Input
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                hintText: "Enter 10-digit mobile number",
                prefixText: "+91 ",
                filled: true,
               // fillColor: AppColors.inputFieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Send OTP Button
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Send OTP",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            // OTP Input
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter OTP",
                filled: true,
               // fillColor: AppColors.inputFieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Verify OTP Button
            ElevatedButton(
              onPressed: _signInWithOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Verify & Sign In",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
