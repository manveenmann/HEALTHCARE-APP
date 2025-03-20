// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project_app/Discover/Diet_Folder/add_meal.dart';
// import 'package:project_app/Discover/Diet_Folder/diet.dart';
// import 'package:project_app/Discover/Diet_Folder/view_meals_page.dart';
// import 'package:project_app/Discover/ExerciseMindFull/add_videos.dart';

// import 'package:project_app/Discover/education.dart';

// import 'package:project_app/Discover/monitor_glucose.dart';
// import 'package:project_app/Home/patient.dart';
// import 'package:project_app/Utils/util.dart';

// class DiscoverPage extends StatefulWidget {
//   const DiscoverPage({super.key});

//   @override
//   State<DiscoverPage> createState() => _DiscoverPageState();
// }

// class _DiscoverPageState extends State<DiscoverPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // ✅ Fixed incorrect syntax
//         child: GridView.count(
//           crossAxisCount: 2, // 2 containers per row
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: 1,
//           children: [
//             CustomContainer(title: "Monitor Glucose", color: Colors.blue[200]!, page: MonitorGlucose()),
//             CustomContainer(title: "Education", color: Colors.greenAccent[200]!, page: Education()),
//            CustomContainer(title: "Exercise", color: Colors.pink[200]!, page:VideoUploader()),
//            // CustomContainer(title: "Diet", color: Colors.purpleAccent[200]!, page:AddMealPage():ViewMealsPage()),
// //  CustomContainer(
// //   title: "Diet",
// //   color: Colors.purpleAccent[200]!,
// //   page: Util.isDoctor()
// //       ? AddMealsPage(userName: Util.user!.fullName) // Doctor adds meals
// //       : PatientHome(), // Patient views meals
// // ),
// FutureBuilder<DocumentSnapshot>(
//   future: FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get(),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator(); // Show loading indicator while fetching role
//     }
//     if (!snapshot.hasData || !snapshot.data!.exists) {
//       return Text("Error: User data not found");
//     }

//     String userRole = snapshot.data!['role'];

//     return CustomContainer(
//       title: "Diet",
//       color: Colors.purpleAccent[200]!,
//       page: userRole == "Doctor" ? AddMealPage() : ViewMealsPage(),
//     );
//   },
// )

//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomContainer extends StatelessWidget {
//   final String title;
//   final Color color;
//   final Widget page;

//   const CustomContainer({required this.title, required this.color, required this.page, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Stack(
//           children: [
//             Center(
//               child: Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Positioned(
//               bottom: 10,
//               right: 10,
//               child: Icon(Icons.arrow_forward, size: 24, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:project_app/Discover/Diet_Folder/add_meal.dart';
// import 'package:project_app/Discover/Diet_Folder/diet.dart';
// import 'package:project_app/Discover/Diet_Folder/view_meals_page.dart';
// import 'package:project_app/Discover/ExerciseMindFull/add_videos.dart';
// import 'package:project_app/Discover/education.dart';
// import 'package:project_app/Discover/monitor_glucose.dart';

// class DiscoverPage extends StatefulWidget {
//   const DiscoverPage({super.key});

//   @override
//   State<DiscoverPage> createState() => _DiscoverPageState();
// }

// class _DiscoverPageState extends State<DiscoverPage> {
//   String userName = "User";

//   @override
//   void initState() {
//     super.initState();
//     fetchUserName();
//   }

//   void fetchUserName() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//       if (userData.exists) {
//         setState(() {
//           userName = userData['name'];
//         });
//       }
//     }
//   }

//   String getGreeting() {
//     int hour = DateTime.now().hour;
//     if (hour < 12) {
//       return "Good Morning";
//     } else if (hour < 17) {
//       return "Good Afternoon";
//     } else {
//       return "Good Evening";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Greeting Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 "Hello, $userName! ${getGreeting()}",
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),

//             // Carousel Slider
//             CarouselSlider(
//   items: [
//     'assets/images/DISCOVER_PAGE_BANNER1.png',
//     'assets/images/DISCOVER_PAGE_BANNER2.png',
//     'assets/images/DISCOVER_PAGE_BANNER3.png',
//     'assets/images/DISCOVER_PAGE_BANNER4.png',
//   ].map((imgPath) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0), // Avoids cutting
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: AspectRatio(
//           aspectRatio: 16 / 9, // Keeps the banner shape
//           child: Image.asset(
//             imgPath,
//             fit: BoxFit.contain, // Ensures the whole image is visible
//           ),
//         ),
//       ),
//     );
//   }).toList(),
//   options: CarouselOptions(
//     height: MediaQuery.of(context).size.height * 0.25,
//     autoPlay: true,
//     enlargeCenterPage: true,
//     aspectRatio: 16 / 9,
//     viewportFraction: 0.9,
//   ),
// ),

//             const SizedBox(height: 20),

//             // Grid Section (Without Titles)
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 1,
//                 children: [
//                   CustomContainer(imagePath: "assets/images/monitor_glucose_icon.png", page: MonitorGlucose()),
//                   CustomContainer(imagePath: "assets/images/education_icon.png", page: Education()),
//                   CustomContainer(imagePath: "assets/images/exercise_icon.png", page: VideoUploader()),

//                   // Diet Section (Dynamic based on User Role)
//                   FutureBuilder<DocumentSnapshot>(
//                     future: FirebaseFirestore.instance
//                         .collection('users')
//                         .doc(FirebaseAuth.instance.currentUser!.uid)
//                         .get(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const CircularProgressIndicator();
//                       }
//                       if (!snapshot.hasData || !snapshot.data!.exists) {
//                         return const Text("Error: User data not found");
//                       }

//                       String userRole = snapshot.data!['role'];
//                       return CustomContainer(
//                         imagePath: "assets/images/diet_icon.png",
//                         page: userRole == "Doctor" ? AddMealPage() : ViewMealsPage(),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomContainer extends StatelessWidget {
//   final String imagePath;
//   final Widget page;

//   const CustomContainer({required this.imagePath, required this.page, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         );
//       },
//       child: Container(
        
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(
//             imagePath,
//             fit: BoxFit.contain, // Ensures image fits inside
//             width: double.infinity,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_app/Discover/Diet_Folder/add_meal.dart';
import 'package:project_app/Discover/Diet_Folder/diet.dart';
import 'package:project_app/Discover/Diet_Folder/view_meals_page.dart';
import 'package:project_app/Discover/ExerciseMindFull/add_videos.dart';
import 'package:project_app/Discover/education.dart';
import 'package:project_app/Discover/monitor_glucose.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  String userName = "User";

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  void fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          userName = userData['name'];
        });
      }
    }
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Greeting Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Hello, $userName! ${getGreeting()}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // ✅ Carousel Slider (Fixed Sizing)
            CarouselSlider(
              items: [
                'assets/images/DISCOVER_PAGE_BANNER1.png',
                'assets/images/DISCOVER_PAGE_BANNER2.png',
                'assets/images/DISCOVER_PAGE_BANNER3.png',
                'assets/images/DISCOVER_PAGE_BANNER4.png',
              ].map((imgPath) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: 16 / 9, // Keeps banners proportional
                      child: Image.asset(
                        imgPath,
                        fit: BoxFit.cover, // Ensures full coverage
                      ),
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width > 600
                    ? 300 // Web height
                    : MediaQuery.of(context).size.height * 0.25, // Mobile height
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Responsive Grid (Fixes Size Issues)
          Padding(
  padding: const EdgeInsets.all(16.0),
  child: GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    //crossAxisCount: 4, 
    crossAxisCount: 2, 
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 1,
    children: [
      CustomContainer(imagePath: "assets/images/monitor_glucose_icon.png", page: MonitorGlucose()),
      CustomContainer(imagePath: "assets/images/education_icon.png", page: Education()),
      CustomContainer(imagePath: "assets/images/exercise_icon.png", page: VideoUploader()),

      // Diet Section (Dynamic based on User Role)
      FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Text("Error: User data not found");
          }

          String userRole = snapshot.data!['role'];
          return CustomContainer(
            imagePath: "assets/images/diet_icon.png",
            page: userRole == "Doctor" ? AddMealPage() : ViewMealsPage(),
          );
        },
      ),
    ],
  ),
),
          ],
        ),
      ),
    );
  }
}

/// ✅ **Fixed CustomContainer**
class CustomContainer extends StatelessWidget {
  final String imagePath;
  final Widget page;

  const CustomContainer({required this.imagePath, required this.page, super.key});

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
      
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // Ensures image fits inside
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
