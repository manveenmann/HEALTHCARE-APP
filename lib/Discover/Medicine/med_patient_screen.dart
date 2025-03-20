// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project_app/Discover/Medicine/add_med.dart';


// class MedicineListPagePatient extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     String uid = _auth.currentUser!.uid; // Get the logged-in user's UID
//     CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     return Scaffold(
//       appBar: AppBar(title: Text("Today's Medicines")),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: medsRef.orderBy('timestamp', descending: true).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text("No medicines found"));
//           }

//           var medicines = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: medicines.length,
//             itemBuilder: (context, index) {
//               var med = medicines[index].data() as Map<String, dynamic>;

//               return Card(
//                 margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 child: ListTile(
//                   title: Text(
//                     med['name'] ?? 'Unknown',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     '${med['dosage'] ?? 'N/A'} - ${med['frequency'] ?? 'N/A'}',
//                   ),
//                   leading: Icon(Icons.medical_services, color: Colors.blue),
//                 ),
//               );
//             },
//           );
//         },
//       ),

//       // Floating Action Button to open the AddMedicinePage form
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddMedicinePage()),
//           );
//         },
//         child: Icon(Icons.add), // "+" icon
//         backgroundColor: Colors.blue,
//         tooltip: "Add Medicine",
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project_app/Discover/Medicine/add_med.dart';

// class MedicineListPagePatient extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     String uid = _auth.currentUser!.uid;
//     CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     return Scaffold(
//       backgroundColor: Color(0xFFE2BBE9),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "Your Medicines Reminder",
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           CalendarWidget(),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: medsRef.orderBy('timestamp', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No medicines found"));
//                 }

//                 var medicines = snapshot.data!.docs;
//                 return ListView.builder(
//                   itemCount: medicines.length,
//                   itemBuilder: (context, index) {
//                     var med = medicines[index].data() as Map<String, dynamic>;
//                     List<Color> cardColors = [
//                       Color(0xFFFF76CE), Color(0xFFFDFFC2), Color(0xFF94FFD8), Color(0xFFA3D8FF)
//                     ];
//                     Color cardColor = cardColors[index % cardColors.length];

//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: cardColor,
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             med['name'] ?? 'Unknown',
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             '${med['dosage'] ?? 'N/A'}',
//                             style: TextStyle(fontSize: 16, color: Colors.black54),
//                           ),
//                           SizedBox(height: 5),
//                           Wrap(
//                             children: (med['frequency'] as List<dynamic>).map<Widget>((freq) {
//                               return Container(
//                                 margin: EdgeInsets.only(right: 5, bottom: 5),
//                                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   freq,
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddMedicinePage()),
//           );
//         },
//         child: Icon(Icons.add),
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         tooltip: "Add Medicine",
//       ),
//     );
//   }
// }

// class CalendarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(7, (index) {
//           return Column(
//             children: [
//               Text("${index + 4}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54)),
//               SizedBox(height: 4),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: index == 1 ? Colors.redAccent : Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"][index],
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: index == 1 ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:project_app/Discover/Medicine/add_med.dart';

// class MedicineListPagePatient extends StatefulWidget {
//   @override
//   _MedicineListPagePatientState createState() => _MedicineListPagePatientState();
// }

// class _MedicineListPagePatientState extends State<MedicineListPagePatient> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   DateTime _selectedDay = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     String uid = _auth.currentUser!.uid;
//     CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     return Scaffold(
//       backgroundColor: Color(0xFFE2BBE9),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "Your Medicines Reminder",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         actions: [
//           IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 📅 Dynamic Calendar
//           TableCalendar(
//             firstDay: DateTime.utc(2023, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             focusedDay: _selectedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             },
//             calendarFormat: CalendarFormat.week,
//             headerStyle: HeaderStyle(
//               formatButtonVisible: false,
//               titleCentered: true,
//             ),
//             availableGestures: AvailableGestures.all,
//           ),

//           // 🔹 Filtering Medicine Cards by Date
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: medsRef.orderBy('timestamp', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No medicines found"));
//                 }

//                 var medicines = snapshot.data!.docs.where((doc) {
//                   var med = doc.data() as Map<String, dynamic>;
//                   DateTime medDate = (med['timestamp'] as Timestamp).toDate();
//                   return isSameDay(medDate, _selectedDay);
//                 }).toList();

//                 if (medicines.isEmpty) {
//                   return Center(child: Text("No medicines for this date"));
//                 }

//                 return ListView.builder(
//                   itemCount: medicines.length,
//                   itemBuilder: (context, index) {
//                     var med = medicines[index].data() as Map<String, dynamic>;
//                     List<Color> cardColors = [
//                       Color(0xFFFF76CE), Color(0xFFFDFFC2), Color(0xFF94FFD8), Color(0xFFA3D8FF)
//                     ];
//                     Color cardColor = cardColors[index % cardColors.length];

//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: cardColor,
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             med['name'] ?? 'Unknown',
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
//                           ),
//                           SizedBox(height: 5),
//                           Wrap(
//                             children: (med['frequency'] as List<dynamic>).map<Widget>((freq) {
//                               return Container(
//                                 margin: EdgeInsets.only(right: 5, bottom: 5),
//                                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   freq,
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       // ➕ Black Floating Action Button in Center
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicinePage()));
//         },
//         child: Icon(Icons.add, color: Colors.white),
//         backgroundColor: Colors.black,
//         tooltip: "Add Medicine",
//       ),

//       // 🔻 Bottom Navigation (For future expansion)
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         color: Colors.white,
//         child: Container(height: 50),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:project_app/Discover/Medicine/add_med.dart';

// class MedicineListPagePatient extends StatefulWidget {
//   @override
//   _MedicineListPagePatientState createState() => _MedicineListPagePatientState();
// }

// class _MedicineListPagePatientState extends State<MedicineListPagePatient> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   DateTime _selectedDay = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     String uid = _auth.currentUser!.uid;
//     CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "Your Medicines Reminder",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         actions: [
//           IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 📅 Dynamic Calendar
//           TableCalendar(
//             firstDay: DateTime.utc(2023, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             focusedDay: _selectedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             },
//             calendarFormat: CalendarFormat.week,
//             headerStyle: HeaderStyle(
//               formatButtonVisible: false,
//               titleCentered: true,
//             ),
//             availableGestures: AvailableGestures.all,
//           ),

//           // 🔹 Filtering Medicine Cards by Date
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: medsRef.orderBy('timestamp', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No medicines found"));
//                 }

//                 var medicines = snapshot.data!.docs.where((doc) {
//                   var med = doc.data() as Map<String, dynamic>;
//                   DateTime medDate = (med['timestamp'] as Timestamp).toDate();
//                   return isSameDay(medDate, _selectedDay);
//                 }).toList();

//                 if (medicines.isEmpty) {
//                   return Center(child: Text("No medicines for this date"));
//                 }

//                 return ListView.builder(
//                   itemCount: medicines.length,
//                   itemBuilder: (context, index) {
//                     var med = medicines[index].data() as Map<String, dynamic>;
//                     List<Color> cardColors = [
//                       Color(0xFFFF76CE), Color(0xFFFDFFC2), Color(0xFF94FFD8), Color(0xFFA3D8FF)
//                     ];
//                     Color cardColor = cardColors[index % cardColors.length];

//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: cardColor,
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             med['name'] ?? 'Unknown',
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
//                           ),
//                           SizedBox(height: 5),
//                           Wrap(
//                             children: (med['frequency'] as List<dynamic>).map<Widget>((freq) {
//                               return Container(
//                                 margin: EdgeInsets.only(right: 5, bottom: 5),
//                                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   freq,
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       // ➕ Black Floating Action Button in Center
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicinePage()));
//         },
//         child: Icon(Icons.add, color: Colors.white),
//         backgroundColor: Colors.black,
//         tooltip: "Add Medicine",
//       ),

//       // 🔻 Bottom Navigation (For future expansion)
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         color: Colors.white,
//         child: Container(height: 50),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:project_app/Discover/Medicine/add_med.dart';

// class MedicineListPagePatient extends StatefulWidget {
//   @override
//   _MedicineListPagePatientState createState() => _MedicineListPagePatientState();
// }

// class _MedicineListPagePatientState extends State<MedicineListPagePatient> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   DateTime _selectedDay = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     String uid = _auth.currentUser!.uid;
//     CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "Your Medicines Reminder",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         actions: [
//           IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 📅 Dynamic Calendar
//           TableCalendar(
//             firstDay: DateTime.utc(2023, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             focusedDay: _selectedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             },
//             calendarFormat: CalendarFormat.week,
//             headerStyle: HeaderStyle(
//               formatButtonVisible: false,
//               titleCentered: true,
//             ),
//             availableGestures: AvailableGestures.all,
//           ),

//           // 🔹 Filtering Medicine Cards by Date
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: medsRef.orderBy('timestamp', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No medicines found"));
//                 }

//                 var medicines = snapshot.data!.docs.where((doc) {
//                   var med = doc.data() as Map<String, dynamic>;
//                   DateTime medDate = (med['timestamp'] as Timestamp).toDate();
//                   return isSameDay(medDate, _selectedDay);
//                 }).toList();

//                 if (medicines.isEmpty) {
//                   return Center(child: Text("No medicines for this date"));
//                 }

//                 return ListView.builder(
//                   itemCount: medicines.length,
//                   itemBuilder: (context, index) {
//                     var med = medicines[index].data() as Map<String, dynamic>;
//                     List<Color> cardColors = [
//                       Color(0xFFFF76CE), Color(0xFFFDFFC2), Color(0xFF94FFD8), Color(0xFFA3D8FF)
//                     ];
//                     Color cardColor = cardColors[index % cardColors.length];

//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: cardColor,
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             med['name'] ?? 'Unknown',
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
//                           ),
//                           SizedBox(height: 5),
//                           Wrap(
//                             children: (med['frequency'] as List<dynamic>).map<Widget>((freq) {
//                               return Container(
//                                 margin: EdgeInsets.only(right: 5, bottom: 5),
//                                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   freq,
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       // ➕ Black Floating Action Button in Center
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicinePage()));
//         },
//         child: Icon(Icons.add, color: Colors.white),
//         backgroundColor: Colors.black,
//         tooltip: "Add Medicine",
//       ),

//       // 🔻 Bottom Navigation (For future expansion)
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         color: Colors.white,
//         child: Container(height: 50),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:project_app/Discover/Medicine/add_med.dart';

// class MedicineListPagePatient extends StatefulWidget {
//   @override
//   _MedicineListPagePatientState createState() => _MedicineListPagePatientState();
// }

// class _MedicineListPagePatientState extends State<MedicineListPagePatient> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   DateTime _selectedDay = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     String uid = _auth.currentUser!.uid;
//     CollectionReference medsRef =
//         FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "Your Medicines Reminder",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         actions: [
//           IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 📅 Calendar for Selecting Date
//           TableCalendar(
//             firstDay: DateTime.utc(2023, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             focusedDay: _selectedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             },
//             calendarFormat: CalendarFormat.week,
//             headerStyle: HeaderStyle(
//               formatButtonVisible: false,
//               titleCentered: true,
//             ),
//             availableGestures: AvailableGestures.all,
//           ),

//           // 🔹 Filtering Medicine Cards by Date
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: medsRef.snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No medicines found"));
//                 }

//                 // Get the selected date in "yyyy-MM-dd" format
//                 String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(_selectedDay);

//                 // Filter medicines based on selected date
//                 var medicines = snapshot.data!.docs.where((doc) {
//                   var med = doc.data() as Map<String, dynamic>;
                  
//                   if (med.containsKey('date')) {
//                     String medDate = med['date'];
//                     return medDate == formattedSelectedDate;
//                   }
//                   return false;
//                 }).toList();

//                 if (medicines.isEmpty) {
//                   return Center(child: Text("No medicines for this date"));
//                 }

//                 return ListView.builder(
//                   itemCount: medicines.length,
//                   itemBuilder: (context, index) {
//                     var med = medicines[index].data() as Map<String, dynamic>;

//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.blue[100],
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             med['name'] ?? 'Unknown',
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
//                           ),
//                           SizedBox(height: 5),
//                           Wrap(
//                             children: (med['frequency'] as List<dynamic>).map<Widget>((freq) {
//                               return Container(
//                                 margin: EdgeInsets.only(right: 5, bottom: 5),
//                                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   freq,
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       // ➕ Floating Action Button to Add Medicines
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicinePage()));
//         },
//         child: Icon(Icons.add, color: Colors.white),
//         backgroundColor: Colors.black,
//         tooltip: "Add Medicine",
//       ),

//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         color: Colors.white,
//         child: Container(height: 50),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math';

import 'package:project_app/Discover/Medicine/add_med.dart';

class MedicineListPagePatient extends StatefulWidget {
  @override
  _MedicineListPagePatientState createState() => _MedicineListPagePatientState();
}

class _MedicineListPagePatientState extends State<MedicineListPagePatient> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DateTime _selectedDay = DateTime.now();

  // Pastel colors for medicine cards
  final List<Color> cardColors = [
    Color(0xFFFF76CE), // Pink
    Color(0xFFFDFCC2), // Yellow
    Color(0xFF94FFD8), // Green
    Color(0xFFA3D8FF), // Blue
  ];

  String getFormattedDate(dynamic date) {
    if (date is Timestamp) {
      return DateFormat('yyyy-MM-dd').format(date.toDate());
    } else if (date is String) {
      return date;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String uid = _auth.currentUser!.uid;
    CollectionReference medsRef =
        FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Medicines Reminder",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // 📅 Calendar for Selecting Date
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarFormat: CalendarFormat.week,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
            availableGestures: AvailableGestures.all,
          ),

          // 🔹 Filtering Medicine Cards by Date
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: medsRef.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No medicines found"));
                }

                String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(_selectedDay);

                var medicines = snapshot.data!.docs.where((doc) {
                  var med = doc.data() as Map<String, dynamic>;
                  if (med.containsKey('date')) {
                    String medDate = getFormattedDate(med['date']);
                    return medDate == formattedSelectedDate;
                  }
                  return false;
                }).toList();

                if (medicines.isEmpty) {
                  return Center(child: Text("No medicines for this date"));
                }

                return ListView.builder(
                  itemCount: medicines.length,
                  itemBuilder: (context, index) {
                    var med = medicines[index].data() as Map<String, dynamic>;
                    Color cardColor = cardColors[index % cardColors.length];

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            med['name'] ?? 'Unknown',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          if (med.containsKey('time'))
                            Text(
                              "Time: ${med['time']}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          if (med.containsKey('frequency'))
                            Wrap(
                              children: (med['frequency'] as List<dynamic>).map<Widget>((freq) {
                                return Container(
                                  margin: EdgeInsets.only(right: 5, bottom: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    freq,
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // ➕ Floating Action Button to Add Medicines
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicinePage()));
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
        tooltip: "Add Medicine",
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        child: Container(height: 50),
      ),
    );
  }
}
