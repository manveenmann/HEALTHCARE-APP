// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AddMedicinePage extends StatefulWidget {
//   @override
//   _AddMedicinePageState createState() => _AddMedicinePageState();
// }

// class _AddMedicinePageState extends State<AddMedicinePage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _dosageController = TextEditingController();
//   final TextEditingController _frequencyController = TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _saveMedicine() async {
//     String uid = _auth.currentUser!.uid; // Get the logged-in user's UID
//     CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     await medsRef.add({
//       'name': _nameController.text,
//       'dosage': _dosageController.text,
//       'frequency': _frequencyController.text,
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Medicine saved successfully')));
//     _nameController.clear();
//     _dosageController.clear();
//     _frequencyController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Medicine')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Medicine Name'),
//             ),
//             TextField(
//               controller: _dosageController,
//               decoration: InputDecoration(labelText: 'Dosage'),
//             ),
//             TextField(
//               controller: _frequencyController,
//               decoration: InputDecoration(labelText: 'Frequency'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveMedicine,
//               child: Text('Save Medicine'),
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
// import 'package:project_app/theme/app_colors.dart';



// class AddMedicinePage extends StatefulWidget {
//   @override
//   _AddMedicinePageState createState() => _AddMedicinePageState();
// }

// class _AddMedicinePageState extends State<AddMedicinePage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _dosageController = TextEditingController();
//   List<String> _selectedFrequencies = []; // Store selected options

//   final List<String> _allFrequencies = [
//     "Before Breakfast",
//     "After Breakfast",
//     "Before Lunch",
//     "After Lunch",
//     "Before Dinner",
//     "After Dinner",
//   ];

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _saveMedicine() async {
//     String uid = _auth.currentUser!.uid; 
//     CollectionReference medsRef =
//         FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     await medsRef.add({
//       'name': _nameController.text,
//       'dosage': _dosageController.text,
//       'frequency': _selectedFrequencies, // Store as a list
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Medicine saved successfully')),
//     );

//     _nameController.clear();
//     _dosageController.clear();
//     setState(() {
//       _selectedFrequencies = [];
//     });
//   }

//   void _showMultiSelectDialog() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setModalState) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Select Frequency",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   Expanded(
//                     child: ListView(
//                       shrinkWrap: true,
//                       children: _allFrequencies.map((frequency) {
//                         return CheckboxListTile(
//                           title: Text(frequency),
//                           value: _selectedFrequencies.contains(frequency),
//                           onChanged: (bool? selected) {
//                             setModalState(() {
//                               if (selected == true) {
//                                 _selectedFrequencies.add(frequency);
//                               } else {
//                                 _selectedFrequencies.remove(frequency);
//                               }
//                             });
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       setState(() {}); // Update UI
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                     ),
//                     child: Text("Done", style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         title: Text('Add Medicine'),
//         backgroundColor: AppColors.primaryColor, 
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Medicine Name',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//             SizedBox(height: 12),
//             TextField(
//               controller: _dosageController,
//               decoration: InputDecoration(
//                 labelText: 'Dosage',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               'Frequency',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 6),
//             GestureDetector(
//               onTap: _showMultiSelectDialog,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: AppColors.primaryColor),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         _selectedFrequencies.isEmpty
//                             ? "Select Frequency"
//                             : _selectedFrequencies.join(", "),
//                         style: TextStyle(fontSize: 16),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _saveMedicine,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.secondaryColor,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text(
//                   'Save Medicine',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
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
// import 'package:intl/intl.dart';
// import 'package:project_app/theme/app_colors.dart';

// class AddMedicinePage extends StatefulWidget {
//   @override
//   _AddMedicinePageState createState() => _AddMedicinePageState();
// }

// class _AddMedicinePageState extends State<AddMedicinePage> {
//   final TextEditingController _nameController = TextEditingController();
//   DateTime? _selectedDate;
//   List<String> _selectedFrequencies = []; // Store selected options

//   final List<String> _allFrequencies = [
//     "Before Breakfast",
//     "After Breakfast",
//     "Before Lunch",
//     "After Lunch",
//     "Before Dinner",
//     "After Dinner",
//   ];

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _saveMedicine() async {
//     if (_nameController.text.isEmpty || _selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter a name and select a date.')),
//       );
//       return;
//     }

//     String uid = _auth.currentUser!.uid;
//     CollectionReference medsRef =
//         FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     await medsRef.add({
//       'name': _nameController.text,
//       'frequency': _selectedFrequencies, // Store as a list
//       'date': Timestamp.fromDate(_selectedDate!), // Store selected date
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Medicine saved successfully')),
//     );

//     _nameController.clear();
//     setState(() {
//       _selectedFrequencies = [];
//       _selectedDate = null;
//     });
//   }

//   void _showMultiSelectDialog() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setModalState) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Select Frequency",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   Expanded(
//                     child: ListView(
//                       shrinkWrap: true,
//                       children: _allFrequencies.map((frequency) {
//                         return CheckboxListTile(
//                           title: Text(frequency),
//                           value: _selectedFrequencies.contains(frequency),
//                           onChanged: (bool? selected) {
//                             setModalState(() {
//                               if (selected == true) {
//                                 _selectedFrequencies.add(frequency);
//                               } else {
//                                 _selectedFrequencies.remove(frequency);
//                               }
//                             });
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       setState(() {}); // Update UI
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                     ),
//                     child: Text("Done", style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2030),
//     );

//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         title: Text('Add Medicine'),
//         backgroundColor: AppColors.primaryColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Medicine Name',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               'Date',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 6),
//             GestureDetector(
//               onTap: () => _selectDate(context),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: AppColors.primaryColor),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       _selectedDate == null
//                           ? "Select Date"
//                           : DateFormat('yyyy-MM-dd').format(_selectedDate!),
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     Icon(Icons.calendar_today, color: AppColors.primaryColor),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               'Frequency',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 6),
//             GestureDetector(
//               onTap: _showMultiSelectDialog,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: AppColors.primaryColor),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         _selectedFrequencies.isEmpty
//                             ? "Select Frequency"
//                             : _selectedFrequencies.join(", "),
//                         style: TextStyle(fontSize: 16),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _saveMedicine,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.secondaryColor,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text(
//                   'Save Medicine',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AddMedicinePage extends StatefulWidget {
  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<String> _selectedFrequencies = [];

  final List<String> _allFrequencies = [
    "Before Breakfast",
    "After Breakfast",
    "Before Lunch",
    "After Lunch",
    "Before Dinner",
    "After Dinner",
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _saveMedicine() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a medicine name.')),
      );
      return;
    }

    String uid = _auth.currentUser!.uid;
    CollectionReference medsRef =
        FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

    await medsRef.add({
      'name': _nameController.text.trim(),
      'frequency': _selectedFrequencies,
      'date': DateFormat('yyyy-MM-dd').format(_selectedDate), // Store date as string
      'timestamp': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Medicine saved successfully')),
    );

    Navigator.pop(context); // Close the add medicine page after saving
  }

  void _showMultiSelectDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select Frequency",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 250, // Prevents overflow
                    child: ListView(
                      shrinkWrap: true,
                      children: _allFrequencies.map((frequency) {
                        return CheckboxListTile(
                          title: Text(frequency),
                          value: _selectedFrequencies.contains(frequency),
                          onChanged: (bool? selected) {
                            setModalState(() {
                              if (selected == true) {
                                _selectedFrequencies.add(frequency);
                              } else {
                                _selectedFrequencies.remove(frequency);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {}); // Update UI
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: Text("Done", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Medicine'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Medicine Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd').format(_selectedDate),
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.calendar_today, color: Colors.black),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Frequency',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            GestureDetector(
              onTap: _showMultiSelectDialog,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _selectedFrequencies.isEmpty
                            ? "Select Frequency"
                            : _selectedFrequencies.join(", "),
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveMedicine,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Medicine',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
