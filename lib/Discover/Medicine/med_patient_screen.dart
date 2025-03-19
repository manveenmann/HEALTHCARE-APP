import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/Discover/Medicine/add_med.dart';


class MedicineListPagePatient extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String uid = _auth.currentUser!.uid; // Get the logged-in user's UID
    CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

    return Scaffold(
      appBar: AppBar(title: Text("Today's Medicines")),
      body: StreamBuilder<QuerySnapshot>(
        stream: medsRef.orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No medicines found"));
          }

          var medicines = snapshot.data!.docs;

          return ListView.builder(
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              var med = medicines[index].data() as Map<String, dynamic>;

              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  title: Text(
                    med['name'] ?? 'Unknown',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${med['dosage'] ?? 'N/A'} - ${med['frequency'] ?? 'N/A'}',
                  ),
                  leading: Icon(Icons.medical_services, color: Colors.blue),
                ),
              );
            },
          );
        },
      ),

      // Floating Action Button to open the AddMedicinePage form
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMedicinePage()),
          );
        },
        child: Icon(Icons.add), // "+" icon
        backgroundColor: Colors.blue,
        tooltip: "Add Medicine",
      ),
    );
  }
}
