// import 'package:flutter/material.dart';
// import 'package:project_app/Model/diet_model.dart';
// import 'package:project_app/services/firebase_services.dart';
// import 'package:uuid/uuid.dart';


// class AddDietPlanScreen extends StatefulWidget {
//   final String doctorId; // Pass logged-in doctor’s ID
//   final String patientId; // Selected patient’s ID

//   AddDietPlanScreen({required this.doctorId, required this.patientId});

//   @override
//   _AddDietPlanScreenState createState() => _AddDietPlanScreenState();
// }

// class _AddDietPlanScreenState extends State<AddDietPlanScreen> {
//   final TextEditingController _breakfastController = TextEditingController();
//   final TextEditingController _lunchController = TextEditingController();
//   final TextEditingController _dinnerController = TextEditingController();
//   final FirebaseService _firebaseService = FirebaseService();

//   void _saveDietPlan() async {
//     String id = Uuid().v4();
//     DietPlan plan = DietPlan(
//       id: id,
//       doctorId: widget.doctorId,
//       patientId: widget.patientId,
//       date: DateTime.now().toIso8601String(),
//       breakfast: _breakfastController.text,
//       lunch: _lunchController.text,
//       dinner: _dinnerController.text,
//     );

//     await _firebaseService.addDietPlan(plan);
//     Navigator.pop(context); // Go back after saving
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Diet Plan")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: _breakfastController, decoration: InputDecoration(labelText: "Breakfast")),
//             TextField(controller: _lunchController, decoration: InputDecoration(labelText: "Lunch")),
//             TextField(controller: _dinnerController, decoration: InputDecoration(labelText: "Dinner")),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: _saveDietPlan, child: Text("Save"))
//           ],
//         ),
//       ),
//     );
//   }
// }
