// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MedicineListPage extends StatefulWidget {
//   @override
//   _MedicineListPageState createState() => _MedicineListPageState();
// }

// class _MedicineListPageState extends State<MedicineListPage> {
//   Future<List<Map<String, dynamic>>> _fetchMedicines() async {
//     print("Fetching medicines...");
//     QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('users').get();
//     List<Map<String, dynamic>> allMedicines = [];

//     for (var user in usersSnapshot.docs) {
//       final userData = user.data() as Map<String, dynamic>?;

//       if (userData != null && userData['role'] == 'Patient') {
//         print("Fetching medicines for patient: ${userData['name']}");

//         QuerySnapshot medicinesSnapshot = await user.reference.collection('medicines').get();

//         for (var doc in medicinesSnapshot.docs) {
//           var medicineData = doc.data() as Map<String, dynamic>;
//           medicineData['patientName'] = userData['name'] ?? 'Unknown Patient';
//           allMedicines.add(medicineData);
//         }
//       }
//     }

//     print("Total medicines fetched: ${allMedicines.length}");
//     return allMedicines;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("All Patients' Medicines")),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: _fetchMedicines(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No medicines found for any patient"));
//           }

//           var medicines = snapshot.data!;

//           return ListView.builder(
//             itemCount: medicines.length,
//             itemBuilder: (context, index) {
//               var med = medicines[index];

//               return Card(
//                 margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 child: ListTile(
//                   title: Text(
//                     med['name'] ?? 'Unknown Medicine',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     '${med['dosage'] ?? 'N/A'} - ${med['frequency'] ?? 'N/A'}',
//                   ),
//                   leading: Icon(Icons.medical_services, color: Colors.blue),
//                   trailing: Text("Patient: ${med['patientName']}"),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// typedef Medicine = Map<String, dynamic>;

// class MedicineListPage extends StatefulWidget {
//   @override
//   _MedicineListPageState createState() => _MedicineListPageState();
// }

// class _MedicineListPageState extends State<MedicineListPage> {
//   DateTime _selectedDay = DateTime.now();
//   final List<Color> cardColors = [
//     Color(0xFFFF76CE), // Pink
//     Color(0xFFFDFCC2), // Yellow
//     Color(0xFF94FFD8), // Green
//     Color(0xFFA3D8FF), // Blue
//   ];

//   String getFormattedDate(dynamic date) {
//     if (date is Timestamp) {
//       return DateFormat('yyyy-MM-dd').format(date.toDate());
//     } else if (date is String) {
//       return date;
//     } else {
//       return '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "All Patients' Medicines",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Calendar UI for Selecting Date
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
//               titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             calendarStyle: CalendarStyle(
//               selectedDecoration: BoxDecoration(
//                 color: Colors.purple,
//                 shape: BoxShape.circle,
//               ),
//               todayDecoration: BoxDecoration(
//                 color: Colors.purple.withOpacity(0.4),
//                 shape: BoxShape.circle,
//               ),
//             ),
//             availableGestures: AvailableGestures.all,
//           ),

//           // Fetching and Displaying Medicines
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance.collection('users').snapshots(),
//               builder: (context, usersSnapshot) {
//                 if (usersSnapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!usersSnapshot.hasData || usersSnapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No patients found"));
//                 }

//                 List<Future<QuerySnapshot>> medicineFutures = [];
//                 for (var user in usersSnapshot.data!.docs) {
//                   var userData = user.data() as Medicine;
//                   if (userData['role'] == 'Patient') {
//                     medicineFutures.add(user.reference.collection('medicines').get());
//                   }
//                 }

//                 return FutureBuilder<List<QuerySnapshot>>(
//                   future: Future.wait(medicineFutures),
//                   builder: (context, medicineSnapshots) {
//                     if (medicineSnapshots.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     }

//                     List<Medicine> allMedicines = [];
//                     for (int i = 0; i < medicineSnapshots.data!.length; i++) {
//                       var patientData = usersSnapshot.data!.docs[i].data() as Medicine;
//                       var medicines = medicineSnapshots.data![i].docs;
//                       for (var med in medicines) {
//                         var medData = med.data() as Medicine;
//                         medData['patientName'] = patientData['name'] ?? 'Unknown Patient';
//                         allMedicines.add(medData);
//                       }
//                     }

//                     String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(_selectedDay);
//                     var filteredMeds = allMedicines.where((med) {
//                       String medDate = getFormattedDate(med['date']);
//                       return medDate == formattedSelectedDate;
//                     }).toList();

//                     if (filteredMeds.isEmpty) {
//                       return Center(child: Text("No medicines for this date"));
//                     }

//                     return ListView.builder(
//                       itemCount: filteredMeds.length,
//                       itemBuilder: (context, index) {
//                         var med = filteredMeds[index];
//                         Color cardColor = cardColors[index % cardColors.length];

//                         return Container(
//                           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: cardColor,
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 med['name'] ?? 'Unknown Medicine',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               // SizedBox(height: 5),
//                               // Text(
//                               //   "Patient: ${med['patientName']}",
//                               //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                               // ),
                              
//                               if (med.containsKey('time'))
//                                 Text(
//                                   "Time: ${med['time']}",
//                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                                 ),
//                               if (med.containsKey('frequency'))
//                                 Wrap(
//                                   children: (med['frequency'] as List<dynamic>).map<Widget>((freq) {
//                                     return Container(
//                                       margin: EdgeInsets.only(right: 5, bottom: 5),
//                                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: Text(
//                                         freq,
//                                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

typedef Medicine = Map<String, dynamic>;

class MedicineListPage extends StatefulWidget {
  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  DateTime _selectedDay = DateTime.now();
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "All Patients' Medicines",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // Calendar UI for Selecting Date
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

          // Fetching and Displaying Medicines
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').where('role', isEqualTo: 'Patient').snapshots(),
              builder: (context, usersSnapshot) {
                if (usersSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!usersSnapshot.hasData || usersSnapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No patients found"));
                }

                List<Future<QuerySnapshot>> medicineFutures = [];

                // Collecting references to patient medicines
                List<String> patientNames = [];
                for (var user in usersSnapshot.data!.docs) {
                  var userData = user.data() as Medicine;
                  String patientName = userData['name'] ?? 'Unknown Patient';
                  patientNames.add(patientName);
                  medicineFutures.add(user.reference.collection('medicines').get());
                }

                return FutureBuilder<List<QuerySnapshot>>(
                  future: Future.wait(medicineFutures),
                  builder: (context, medicineSnapshots) {
                    if (medicineSnapshots.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    List<Medicine> allMedicines = [];
                    for (int i = 0; i < medicineSnapshots.data!.length; i++) {
                      var medicines = medicineSnapshots.data![i].docs;
                      for (var med in medicines) {
                        var medData = med.data() as Medicine;
                        medData['patientName'] = patientNames[i]; // Assigning correct patient name
                        allMedicines.add(medData);
                      }
                    }

                    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(_selectedDay);
                    var filteredMeds = allMedicines.where((med) {
                      String medDate = getFormattedDate(med['date']);
                      return medDate == formattedSelectedDate;
                    }).toList();

                    if (filteredMeds.isEmpty) {
                      return Center(child: Text("No medicines for this date"));
                    }

                    return ListView.builder(
                      itemCount: filteredMeds.length,
                      itemBuilder: (context, index) {
                        var med = filteredMeds[index];
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
                                med['name'] ?? 'Unknown Medicine',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Patient: ${med['patientName']}", // Now correctly displaying the patient name
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
