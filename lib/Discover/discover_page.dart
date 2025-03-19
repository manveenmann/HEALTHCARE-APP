import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/Discover/Diet_Folder/add_meal.dart';
import 'package:project_app/Discover/Diet_Folder/diet.dart';
import 'package:project_app/Discover/Diet_Folder/view_meals_page.dart';

import 'package:project_app/Discover/education.dart';
import 'package:project_app/Discover/exercise.dart';
import 'package:project_app/Discover/monitor_glucose.dart';
import 'package:project_app/Home/patient.dart';
import 'package:project_app/Utils/util.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // ✅ Fixed incorrect syntax
        child: GridView.count(
          crossAxisCount: 2, // 2 containers per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
          children: [
            CustomContainer(title: "Monitor Glucose", color: Colors.blue[200]!, page: MonitorGlucose()),
            CustomContainer(title: "Education", color: Colors.greenAccent[200]!, page: Education()),
            CustomContainer(title: "Exercise", color: Colors.pink[200]!, page: MindfulnessHomePage()),
           // CustomContainer(title: "Diet", color: Colors.purpleAccent[200]!, page:AddMealPage():ViewMealsPage()),
//  CustomContainer(
//   title: "Diet",
//   color: Colors.purpleAccent[200]!,
//   page: Util.isDoctor()
//       ? AddMealsPage(userName: Util.user!.fullName) // Doctor adds meals
//       : PatientHome(), // Patient views meals
// ),
FutureBuilder<DocumentSnapshot>(
  future: FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Show loading indicator while fetching role
    }
    if (!snapshot.hasData || !snapshot.data!.exists) {
      return Text("Error: User data not found");
    }

    String userRole = snapshot.data!['role'];

    return CustomContainer(
      title: "Diet",
      color: Colors.purpleAccent[200]!,
      page: userRole == "Doctor" ? AddMealPage() : ViewMealsPage(),
    );
  },
)

          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final Color color;
  final Widget page;

  const CustomContainer({required this.title, required this.color, required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Positioned(
              bottom: 10,
              right: 10,
              child: Icon(Icons.arrow_forward, size: 24, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
