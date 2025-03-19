// import 'package:flutter/material.dart';
// import 'package:project_app/Discover/Diet_Folder/breakfast_items_page.dart';
// import 'package:project_app/Discover/Diet_Folder/dinner_items_page.dart';
// import 'package:project_app/Discover/Diet_Folder/lunch_items_page.dart';


// class AddMealsPage extends StatelessWidget {
//   const AddMealsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Meals"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Date selection row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Today, 6 Nov 2021",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.arrow_drop_down),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             // Meal list
//             Expanded(
//               child: ListView(
//                 children: [
//                   MealCard(
//                     title: "Breakfast",
//                     subtitle: "Recommended 830-1170 Cal",
//                     image: "assets/images/breakfast.png",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const BreakfastItemsPage()),
//                       );
//                     },
//                   ),
//                   MealCard(
//                     title: "Lunch",
//                     subtitle: "Recommended 255-370 Cal",
//                     image: "assets/images/lunch.png",
//                      onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const LunchItemsPage()),
//                       );
//                     },
//                   ),
                
//                   MealCard(
//                     title: "Dinner",
//                     subtitle: "Recommended 255-370 Cal",
//                     image: "assets/images/dinner.png",
//                      onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const DinnerItemsPage()),
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

// class MealCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String image;
//   final VoidCallback? onTap;

//   const MealCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.image,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Navigate on tap
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage(image),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:project_app/Discover/Diet_Folder/breakfast_items_page.dart';
// import 'package:project_app/Discover/Diet_Folder/dinner_items_page.dart';
// import 'package:project_app/Discover/Diet_Folder/lunch_items_page.dart';

// class AddMealsPage extends StatelessWidget {
//   final String userName;
  
//   const AddMealsPage({super.key, required this.userName});

//   @override
//   Widget build(BuildContext context) {
//     String currentDate = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());
    
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Meals - $userName"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Date selection row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   currentDate,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.arrow_drop_down),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             // Meal list
//             Expanded(
//               child: ListView(
//                 children: [
//                   MealCard(
//                     title: "Breakfast",
//                     subtitle: "Recommended 830-1170 Cal",
//                     image: "assets/images/breakfast.png",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const BreakfastItemsPage()),
//                       );
//                     },
//                   ),
//                   MealCard(
//                     title: "Lunch",
//                     subtitle: "Recommended 255-370 Cal",
//                     image: "assets/images/lunch.png",
//                      onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const LunchItemsPage()),
//                       );
//                     },
//                   ),
                  
//                   MealCard(
//                     title: "Dinner",
//                     subtitle: "Recommended 255-370 Cal",
//                     image: "assets/images/dinner.png",
//                      onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const DinnerItemsPage()),
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

// class MealCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String image;
//   final VoidCallback? onTap;

//   const MealCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.image,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Navigate on tap
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage(image),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_app/Discover/Diet_Folder/breakfast_items_page.dart';
import 'package:project_app/Discover/Diet_Folder/dinner_items_page.dart';
import 'package:project_app/Discover/Diet_Folder/lunch_items_page.dart';

class AddMealsPage extends StatelessWidget {
  final String userName;

  const AddMealsPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFE2BBE9), // Background color
      appBar: AppBar(
        title: Text("Add Meals - $userName"),
        backgroundColor: Colors.deepPurpleAccent, // AppBar color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date selection row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentDate,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Meal list
            Expanded(
              child: ListView(
                children: [
                  MealCard(
                    title: "Breakfast",
                    subtitle: "",
                    image: "assets/images/breakfast.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BreakfastItemsPage()),
                      );
                    },
                  ),
                  MealCard(
                    title: "Lunch",
                    subtitle: "",
                    image: "assets/images/lunch.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LunchItemsPage()),
                      );
                    },
                  ),
                  MealCard(
                    title: "Dinner",
                    subtitle: "",
                    image: "assets/images/dinner.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DinnerItemsPage()),
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

class MealCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;

  const MealCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate on tap
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white, // Card background
        elevation: 5, // Shadow effect
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50, // Bigger avatar
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
