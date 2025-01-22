import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> widgets = [
    const Center(child: Text("Home Page", style: TextStyle(color: Colors.white, fontSize: 20))),
    const Center(child: Text("Turfs Page", style: TextStyle(color: Colors.white, fontSize: 20))),
    const Center(child: Text("Players Page", style: TextStyle(color: Colors.white, fontSize: 20))),
    const Center(child: Text("Profile Page", style: TextStyle(color: Colors.white, fontSize: 20))),
  ];

  final List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
      backgroundColor: Colors.black,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_football),
      label: "Turfs",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_handball),
      label: "Players",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed('/login'); // Redirect to the login page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "SPOCO",
          style: TextStyle(
            color: Color.fromARGB(255, 58, 243, 33),
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: widgets[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: navBarItems,
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 58, 243, 3),
        unselectedItemColor: Colors.white,
        onTap: onItemSelected,
      ),
    );
  }
}
