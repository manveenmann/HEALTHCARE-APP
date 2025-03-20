import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/Anthropometric/anthro.dart';
import 'package:project_app/Discover/Medicine/med_screen.dart';
import 'package:project_app/Discover/discover_page.dart';
import 'package:project_app/theme/app_colors.dart';

class doctorHome extends StatefulWidget {
  const doctorHome({super.key});

  @override
  State<doctorHome> createState() => _doctorHomeState();
}

class _doctorHomeState extends State<doctorHome> {
 

     int selectedIndex = 0;

  // Widgets for different pages/screens
  List<Widget> widgets = [
    AnthropometricDetailsPage(),//1 screen 
    DiscoverPage(),//discover screen 
   MedicineListPage(),
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
      icon: Icon(Icons.medication),
      label: "Medicine",
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



  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    
      body: Center(child: widgets[selectedIndex]), // Display the widget based on the selected index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: navBarItems,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.white,
        onTap: onItemSelected,
      ),
    );
  }
  }
