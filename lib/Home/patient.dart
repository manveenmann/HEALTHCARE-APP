import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth for logout
import 'package:project_app/Anthropometric/anthro.dart';
import 'package:project_app/theme/app_colors.dart'; // Import your custom theme if required

class PatientHome extends StatefulWidget {
  const PatientHome({super.key});

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  int selectedIndex = 0;

  // Widgets for different pages/screens
  List<Widget> widgets = [
    AnthropometricDetailsPage(),
    const Text("Turfs Page"),
    const Text("Players Page"),
    const Text("Profile Page"),
  ];

  // Bottom navigation bar items
  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      backgroundColor:  AppColors.backgroundColor,
      icon: Icon(
        Icons.home,
      ),
      label: "Home",
    ),
    const BottomNavigationBarItem(
       icon: Icon(Icons.explore_rounded),
      label: "Discover",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_handball),
      label: "Help",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  // Logout function
  logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed("/");
  }

  // Handle item selection for bottom navigation
  onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Fetch user location on start
  getLocationOfUser() {
    // Add logic to fetch the user's location if required
  }

  @override
  void initState() {
    super.initState();
    getLocationOfUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(child: widgets[selectedIndex]), // Display the widget based on the selected index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: navBarItems,
        currentIndex: selectedIndex,
        selectedItemColor:  AppColors.primaryColor,
        unselectedItemColor: Colors.white,
        onTap: onItemSelected,
      ),
    );
  }
}
