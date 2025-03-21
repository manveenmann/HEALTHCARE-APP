// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class AddMealPage extends StatefulWidget {
//   @override
//   _AddMealPageState createState() => _AddMealPageState();
// }

// class _AddMealPageState extends State<AddMealPage> {
//   final TextEditingController _dishNameController = TextEditingController();
//   final TextEditingController _detailsController = TextEditingController();
//   String? _selectedMealType;
//   String? _selectedDay;
//   File? _imageFile;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _uploadMeal() async {
//     if (_dishNameController.text.isEmpty || _detailsController.text.isEmpty || _selectedMealType == null || _selectedDay == null || _imageFile == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields and select an image.")));
//       return;
//     }

//     try {
//       String imageUrl = await _uploadImageToFirebase();
//       await FirebaseFirestore.instance.collection('meals').add({
//         'dishName': _dishNameController.text,
//         'details': _detailsController.text,
//         'mealType': _selectedMealType,
//         'day': _selectedDay,
//         'imageUrl': imageUrl,
//         'createdAt': Timestamp.now(),
//       });
      
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Meal added successfully!")));
//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
//     }
//   }

//   Future<String> _uploadImageToFirebase() async {
//     String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
//     Reference ref = FirebaseStorage.instance.ref().child('meal_images/$fileName');
//     UploadTask uploadTask = ref.putFile(_imageFile!);
//     TaskSnapshot snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Meal")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _dishNameController,
//               decoration: InputDecoration(labelText: "Dish Name"),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _detailsController,
//               decoration: InputDecoration(labelText: "Details"),
//               maxLines: 3,
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               value: _selectedMealType,
//               items: ["Breakfast", "Lunch", "Dinner"].map((meal) => DropdownMenuItem(value: meal, child: Text(meal))).toList(),
//               onChanged: (value) => setState(() => _selectedMealType = value),
//               decoration: InputDecoration(labelText: "Meal Type"),
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               value: _selectedDay,
//               items: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].map((day) => DropdownMenuItem(value: day, child: Text(day))).toList(),
//               onChanged: (value) => setState(() => _selectedDay = value),
//               decoration: InputDecoration(labelText: "Day of the Week"),
//             ),
//             SizedBox(height: 10),
//             _imageFile == null
//                 ? Text("No Image Selected")
//                 : Image.file(_imageFile!, height: 100),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text("Select Image"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadMeal,
//               child: Text("Save Meal"),
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

// class AddMealPage extends StatefulWidget {
//   @override
//   _AddMealPageState createState() => _AddMealPageState();
// }

// class _AddMealPageState extends State<AddMealPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _dishNameController = TextEditingController();
//   final TextEditingController _detailsController = TextEditingController();
//   String? _selectedDay;
//   String? _selectedMealType;

//   final List<String> days = [
//     'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
//   ];
//   final List<String> mealTypes = ['Breakfast', 'Lunch', 'Dinner'];

//   String? userRole; // To store user role

//   @override
//   void initState() {
//     super.initState();
//     _checkUserRole();
//   }

//   // Fetch user role from Firestore
//   Future<void> _checkUserRole() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

//     if (userDoc.exists && userDoc['role'] == 'Doctor') {
//       setState(() {
//         userRole = 'Doctor';
//       });
//     } else {
//       setState(() {
//         userRole = 'Patient';
//       });
//     }
//   }

//   Future<void> _saveMeal() async {
//     if (userRole != 'Doctor') {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Only doctors can add meals!')),
//       );
//       return;
//     }

//     if (_formKey.currentState!.validate()) {
//       String uid = FirebaseAuth.instance.currentUser!.uid;

//       await FirebaseFirestore.instance.collection('users').doc(uid).collection('meals').add({
//         'day': _selectedDay,
//         'mealType': _selectedMealType,
//         'dishName': _dishNameController.text.trim(),
//         'details': _detailsController.text.trim(),
//         'timestamp': FieldValue.serverTimestamp(),
//       });
    


//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Meal added successfully!')),
//       );

//       // Clear fields after saving
//       _dishNameController.clear();
//       _detailsController.clear();
//       setState(() {
//         _selectedDay = null;
//         _selectedMealType = null;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (userRole == null) {
//       return Scaffold(body: Center(child: CircularProgressIndicator())); // Loading state
//     }

//     return Scaffold(
//       appBar: AppBar(title: Text('Add Meal')),
//       body: userRole == 'Doctor'
//           ? Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: _selectedDay,
//                       decoration: InputDecoration(labelText: 'Select Day'),
//                       items: days.map((day) {
//                         return DropdownMenuItem(value: day, child: Text(day));
//                       }).toList(),
//                       onChanged: (value) => setState(() => _selectedDay = value),
//                       validator: (value) => value == null ? 'Select a day' : null,
//                     ),
//                     SizedBox(height: 10),
//                     DropdownButtonFormField<String>(
//                       value: _selectedMealType,
//                       decoration: InputDecoration(labelText: 'Select Meal Type'),
//                       items: mealTypes.map((type) {
//                         return DropdownMenuItem(value: type, child: Text(type));
//                       }).toList(),
//                       onChanged: (value) => setState(() => _selectedMealType = value),
//                       validator: (value) => value == null ? 'Select a meal type' : null,
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       controller: _dishNameController,
//                       decoration: InputDecoration(labelText: 'Dish Name'),
//                       validator: (value) => value!.isEmpty ? 'Enter dish name' : null,
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       controller: _detailsController,
//                       decoration: InputDecoration(labelText: 'Details'),
//                       maxLines: 3,
//                       validator: (value) => value!.isEmpty ? 'Enter meal details' : null,
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _saveMeal,
//                       child: Text('Save Meal'),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           : Center(
//               child: Text(
//                 'You do not have access to this page!',
//                 style: TextStyle(fontSize: 18, color: Colors.red),
//               ),
//             ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AddMealPage extends StatefulWidget {
//   @override
//   _AddMealPageState createState() => _AddMealPageState();
// }

// class _AddMealPageState extends State<AddMealPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _bmiController = TextEditingController();
//   final TextEditingController _activityController = TextEditingController();
//   final TextEditingController _caloriesController = TextEditingController();
//   final TextEditingController _preBreakfastController = TextEditingController();
//   final TextEditingController _breakfastController = TextEditingController();
//   final TextEditingController _lunchController = TextEditingController();
//   final TextEditingController _dinnerController = TextEditingController();
//   final TextEditingController _energyPer100gController = TextEditingController();

//   String? _selectedDay;
//   final List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
//   String? userRole;

//   @override
//   void initState() {
//     super.initState();
//     _checkUserRole();
//   }

//   Future<void> _checkUserRole() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
//     if (userDoc.exists && userDoc['role'] == 'Doctor') {
//       setState(() {
//         userRole = 'Doctor';
//       });
//     } else {
//       setState(() {
//         userRole = 'Patient';
//       });
//     }
//   }

//   Future<void> _saveMeal() async {
//     if (userRole != 'Doctor') {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Only doctors can add meals!')));
//       return;
//     }

//     if (_formKey.currentState!.validate()) {
//       String uid = FirebaseAuth.instance.currentUser!.uid;
//       await FirebaseFirestore.instance.collection('users').doc(uid).collection('meals').add({
//         'day': _selectedDay,
//         'BMI': _bmiController.text.trim(),
//         'Activity': _activityController.text.trim(),
//         'Recommended Calories': _caloriesController.text.trim(),
//         'Pre-Breakfast': _preBreakfastController.text.trim(),
//         'Breakfast': _breakfastController.text.trim(),
//         'Lunch': _lunchController.text.trim(),
//         'Dinner': _dinnerController.text.trim(),
//         'Energy per 100g': _energyPer100gController.text.trim(),
//         'timestamp': FieldValue.serverTimestamp(),
//       });
      
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Meal added successfully!')));
//       _clearFields();
//     }
//   }

//   void _clearFields() {
//     _bmiController.clear();
//     _activityController.clear();
//     _caloriesController.clear();
//     _preBreakfastController.clear();
//     _breakfastController.clear();
//     _lunchController.clear();
//     _dinnerController.clear();
//     _energyPer100gController.clear();
//     setState(() {
//       _selectedDay = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (userRole == null) {
//       return Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Meal Plan', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: userRole == 'Doctor'
//           ? Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildDropdownField('Select Day', _selectedDay, days, (value) => setState(() => _selectedDay = value)),
//                       _buildTextField(_bmiController, 'BMI'),
//                       _buildTextField(_activityController, 'Activity'),
//                       _buildTextField(_caloriesController, 'Recommended Calories'),
//                       _buildTextField(_preBreakfastController, 'Pre-Breakfast'),
//                       _buildTextField(_breakfastController, 'Breakfast'),
//                       _buildTextField(_lunchController, 'Lunch'),
//                       _buildTextField(_dinnerController, 'Dinner'),
//                       _buildTextField(_energyPer100gController, 'Energy per 100g (kcal)'),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
//                         onPressed: _saveMeal,
//                         child: Text('Save Meal Plan', style: TextStyle(color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           : Center(
//               child: Text(
//                 'You do not have access to this page!',
//                 style: TextStyle(fontSize: 18, color: Colors.red),
//               ),
//             ),
//     );
//   }

//   Widget _buildDropdownField(String label, String? value, List<String> items, ValueChanged<String?> onChanged) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
//         items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
//         onChanged: onChanged,
//         validator: (value) => value == null ? 'Select a $label' : null,
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
//         validator: (value) => value!.isEmpty ? 'Enter $label' : null,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/theme/app_colors.dart';

class AddMealPage extends StatefulWidget {
  @override
  _AddMealPageState createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bmiController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _preBreakfastController = TextEditingController();
  final TextEditingController _breakfastController = TextEditingController();
  final TextEditingController _lunchController = TextEditingController();
  final TextEditingController _dinnerController = TextEditingController();
  final TextEditingController _energyPer100gController = TextEditingController();

  String? _selectedDay;
  final List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  String? userRole;

  @override
  void initState() {
    super.initState();
    _checkUserRole();
  }

  Future<void> _checkUserRole() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      userRole = userDoc.exists && userDoc['role'] == 'Doctor' ? 'Doctor' : 'Patient';
    });
  }

  Future<void> _saveMeal() async {
    if (userRole != 'Doctor') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Only doctors can add meals!')));
      return;
    }

    if (_formKey.currentState!.validate()) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).collection('meals').add({
        'day': _selectedDay,
        'BMI': _bmiController.text.trim(),
        'Activity': _activityController.text.trim(),
        'Recommended Calories': _caloriesController.text.trim(),
        'Pre-Breakfast': _preBreakfastController.text.trim(),
        'Breakfast': _breakfastController.text.trim(),
        'Lunch': _lunchController.text.trim(),
        'Dinner': _dinnerController.text.trim(),
        'Energy per 100g': _energyPer100gController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Meal added successfully!')));
      _clearFields();
    }
  }

  void _clearFields() {
    _bmiController.clear();
    _activityController.clear();
    _caloriesController.clear();
    _preBreakfastController.clear();
    _breakfastController.clear();
    _lunchController.clear();
    _dinnerController.clear();
    _energyPer100gController.clear();
    setState(() => _selectedDay = null);
  }

  @override
  Widget build(BuildContext context) {
    if (userRole == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Add Meal Plan', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: userRole == 'Doctor'
          ? Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDropdownField('Select Day', _selectedDay, days, (value) => setState(() => _selectedDay = value)),
                      _buildTextField(_bmiController, 'BMI'),
                      _buildTextField(_activityController, 'Activity'),
                      _buildTextField(_caloriesController, 'Recommended Calories'),
                      _buildTextField(_preBreakfastController, 'Pre-Breakfast'),
                      _buildTextField(_breakfastController, 'Breakfast'),
                      _buildTextField(_lunchController, 'Lunch'),
                      _buildTextField(_dinnerController, 'Dinner'),
                      _buildTextField(_energyPer100gController, 'Energy per 100g (kcal)'),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          ),
                          onPressed: _saveMeal,
                          child: Text('Save Meal Plan', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: Text(
                'You do not have access to this page!',
                style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }

  Widget _buildDropdownField(String label, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Select a $label' : null,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) => value!.isEmpty ? 'Enter $label' : null,
      ),
    );
  }
}
