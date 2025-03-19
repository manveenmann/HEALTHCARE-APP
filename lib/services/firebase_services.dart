import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_app/Model/diet_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 Add Diet Plan (Doctor Adds for a Patient)
  Future<void> addDietPlan(String patientId, DietPlan dietPlan) async {
    await _firestore
        .collection("users")
        .doc(patientId)
        .collection("dietPlans")
        .add(dietPlan.toMap());
  }

  // 🔹 Fetch Diet Plans for a Specific Patient (Real-Time)
  Stream<List<DietPlan>> getDietPlansForPatient(String patientId) {
    return _firestore
        .collection("users")
        .doc(patientId)
        .collection("dietPlans")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => DietPlan.fromMap(doc.data())).toList());
  }
}
