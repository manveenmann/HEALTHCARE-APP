import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineListPage extends StatefulWidget {
  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  Future<List<Map<String, dynamic>>> _fetchMedicines() async {
    print("Fetching medicines...");
    QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('users').get();
    List<Map<String, dynamic>> allMedicines = [];

    for (var user in usersSnapshot.docs) {
      final userData = user.data() as Map<String, dynamic>?;

      if (userData != null && userData['role'] == 'Patient') {
        print("Fetching medicines for patient: ${userData['name']}");

        QuerySnapshot medicinesSnapshot = await user.reference.collection('medicines').get();

        for (var doc in medicinesSnapshot.docs) {
          var medicineData = doc.data() as Map<String, dynamic>;
          medicineData['patientName'] = userData['name'] ?? 'Unknown Patient';
          allMedicines.add(medicineData);
        }
      }
    }

    print("Total medicines fetched: ${allMedicines.length}");
    return allMedicines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Patients' Medicines")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchMedicines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No medicines found for any patient"));
          }

          var medicines = snapshot.data!;

          return ListView.builder(
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              var med = medicines[index];

              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  title: Text(
                    med['name'] ?? 'Unknown Medicine',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${med['dosage'] ?? 'N/A'} - ${med['frequency'] ?? 'N/A'}',
                  ),
                  leading: Icon(Icons.medical_services, color: Colors.blue),
                  trailing: Text("Patient: ${med['patientName']}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

