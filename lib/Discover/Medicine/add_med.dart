import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddMedicinePage extends StatefulWidget {
  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _saveMedicine() async {
    String uid = _auth.currentUser!.uid; // Get the logged-in user's UID
    CollectionReference medsRef = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines');

    await medsRef.add({
      'name': _nameController.text,
      'dosage': _dosageController.text,
      'frequency': _frequencyController.text,
      'timestamp': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Medicine saved successfully')));
    _nameController.clear();
    _dosageController.clear();
    _frequencyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Medicine')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              controller: _dosageController,
              decoration: InputDecoration(labelText: 'Dosage'),
            ),
            TextField(
              controller: _frequencyController,
              decoration: InputDecoration(labelText: 'Frequency'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveMedicine,
              child: Text('Save Medicine'),
            ),
          ],
        ),
      ),
    );
  }
}
