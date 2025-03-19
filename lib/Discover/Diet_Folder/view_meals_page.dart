// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ViewMealsPage extends StatefulWidget {
//   @override
//   _ViewMealsPageState createState() => _ViewMealsPageState();
// }

// class _ViewMealsPageState extends State<ViewMealsPage> {
//   String? _selectedDay;
//   final List<String> days = [
//     'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
//   ];

//   Future<List<Map<String, dynamic>>> _fetchMeals() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
    
//     QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('users').get();

//     List<Map<String, dynamic>> allMeals = [];

//     for (var user in usersSnapshot.docs) {
//       if (user['role'] == 'Doctor') {
//         QuerySnapshot mealsSnapshot = await user.reference.collection('meals').get();
//         allMeals.addAll(mealsSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
//       }
//     }

//     return allMeals;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('View Meals')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButtonFormField<String>(
//               value: _selectedDay,
//               decoration: InputDecoration(labelText: 'Filter by Day'),
//               items: days.map((day) {
//                 return DropdownMenuItem(value: day, child: Text(day));
//               }).toList(),
//               onChanged: (value) => setState(() => _selectedDay = value),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: FutureBuilder<List<Map<String, dynamic>>>(
//                 future: _fetchMeals(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No meals found.'));
//                   }

//                   List<Map<String, dynamic>> meals = snapshot.data!;
//                   if (_selectedDay != null) {
//                     meals = meals.where((meal) => meal['day'] == _selectedDay).toList();
//                   }

//                   return ListView.builder(
//                     itemCount: meals.length,
//                     itemBuilder: (context, index) {
//                       var meal = meals[index];
//                       return Card(
//                         margin: EdgeInsets.symmetric(vertical: 8),
//                         child: ListTile(
//                           title: Text(meal['dishName'] ?? 'No Name'),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Meal Type: ${meal['mealType']}'),
//                               Text('Details: ${meal['details']}'),
//                               Text('Day: ${meal['day']}'),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ViewMealsPage extends StatefulWidget {
//   @override
//   _ViewMealsPageState createState() => _ViewMealsPageState();
// }

// class _ViewMealsPageState extends State<ViewMealsPage> {
//   String? _selectedDay;
//   final List<String> days = [
//     'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
//   ];

//   Future<List<Map<String, dynamic>>> _fetchMeals() async {
//     QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('users').get();
//     List<Map<String, dynamic>> allMeals = [];

//     for (var user in usersSnapshot.docs) {
//       if (user['role'] == 'Doctor') {
//         QuerySnapshot mealsSnapshot = await user.reference.collection('meals').get();
//         allMeals.addAll(mealsSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
//       }
//     }
//     return allMeals;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Meals', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButtonFormField<String>(
//               value: _selectedDay,
//               decoration: InputDecoration(
//                 labelText: 'Filter by Day',
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.teal.shade50,
//               ),
//               items: days.map((day) {
//                 return DropdownMenuItem(value: day, child: Text(day));
//               }).toList(),
//               onChanged: (value) => setState(() => _selectedDay = value),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: FutureBuilder<List<Map<String, dynamic>>>(
//                 future: _fetchMeals(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No meals found.', style: TextStyle(fontSize: 16)));
//                   }

//                   List<Map<String, dynamic>> meals = snapshot.data!;
//                   if (_selectedDay != null) {
//                     meals = meals.where((meal) => meal['day'] == _selectedDay).toList();
//                   }

//                   return ListView.builder(
//                     itemCount: meals.length,
//                     itemBuilder: (context, index) {
//                       var meal = meals[index];
//                       return Card(
//                         color: Colors.teal.shade100,
//                         margin: EdgeInsets.symmetric(vertical: 8),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         child: Padding(
//                           padding: EdgeInsets.all(12.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
                             
//                               Text('BMI: ${meal['bmi']}',
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                               Text('Activity: ${meal['activity']}',
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                               Text('Recommended Calories: ${meal['recommendedCalories']} kcal',
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                               Divider(color: Colors.black54),
//                               Text('Pre-Breakfast: ${meal['preBreakfast']}',
//                                   style: TextStyle(fontSize: 14)),
//                               Text('Breakfast: ${meal['breakfast']}',
//                                   style: TextStyle(fontSize: 14)),
//                               Text('Lunch: ${meal['lunch']}',
//                                   style: TextStyle(fontSize: 14)),
//                               Text('Dinner: ${meal['dinner']}',
//                                   style: TextStyle(fontSize: 14)),
//                               SizedBox(height: 5),
//                               Text('Energy (per 100g): ${meal['energyPer100g']} kcal',
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewMealsPage extends StatefulWidget {
  @override
  _ViewMealsPageState createState() => _ViewMealsPageState();
}

class _ViewMealsPageState extends State<ViewMealsPage> {
  String? _selectedDay;
  final List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

 Future<List<Map<String, dynamic>>> _fetchMeals() async {
  QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('users').get();
  List<Map<String, dynamic>> allMeals = [];

  for (var user in usersSnapshot.docs) {
    final userData = user.data() as Map<String, dynamic>?; // Cast safely

    if (userData != null && userData.containsKey('role') && userData['role'] == 'Doctor') {
      QuerySnapshot mealsSnapshot = await user.reference.collection('meals').get();
      for (var doc in mealsSnapshot.docs) {
        print("Fetched meal: ${doc.data()}"); // Debugging log
        allMeals.add(doc.data() as Map<String, dynamic>);
      }
    }
  }
  return allMeals;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Meals', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedDay,
              decoration: InputDecoration(
                labelText: 'Filter by Day',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal.shade50,
              ),
              items: days.map((day) {
                return DropdownMenuItem(value: day, child: Text(day));
              }).toList(),
              onChanged: (value) => setState(() => _selectedDay = value),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchMeals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No meals found.', style: TextStyle(fontSize: 16)));
                  }

                  List<Map<String, dynamic>> meals = snapshot.data!;
                  if (_selectedDay != null) {
                    meals = meals.where((meal) => meal['day'] == _selectedDay).toList();
                  }

                  return ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      var meal = meals[index];
                      return Card(
                        color: Colors.teal.shade100,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('BMI: ${meal['BMI'] ?? 'N/A'}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              Text('Activity: ${meal['Activity'] ?? 'N/A'}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              Text('Recommended Calories: ${meal['Recommended Calories'] ?? 'N/A'} kcal',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              Divider(color: Colors.black54),
                              Text('Pre-Breakfast: ${meal['Pre-Breakfast'] ?? 'N/A'}',
                                  style: TextStyle(fontSize: 14)),
                              Text('Breakfast: ${meal['Breakfast'] ?? 'N/A'}',
                                  style: TextStyle(fontSize: 14)),
                              Text('Lunch: ${meal['Lunch'] ?? 'N/A'}',
                                  style: TextStyle(fontSize: 14)),
                              Text('Dinner: ${meal['Dinner'] ?? 'N/A'}',
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(height: 5),
                              Text('Energy (per 100g): ${meal['Energy per 100g'] ?? 'N/A'} kcal',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
