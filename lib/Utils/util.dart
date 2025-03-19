import 'package:project_app/Model/user_model.dart';

abstract class Util {
  static String? UID;
  static UserModel? user;

  static bool isDoctor() => user?.role?.toLowerCase() == "doctor";
  static bool isPatient() => user?.role?.toLowerCase() == "patient";

  // Check function to verify user role
  static void checkUserRole() {
    if (user == null || UID == null) {
      print("⚠️ User not logged in or UID is null.");
    } else if (isDoctor()) {
      print("✅ Logged in as Doctor (UID: $UID)");
    } else if (isPatient()) {
      print("✅ Logged in as Patient (UID: $UID)");
    } else {
      print("❓ Unknown role: ${user?.role}");
    }
  }
}
