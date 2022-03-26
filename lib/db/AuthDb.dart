import 'package:firebase_auth/firebase_auth.dart';

class AuthDb {
  String get uiD {
    try {
      final uId = FirebaseAuth.instance.currentUser.uid;
      return uId;
    } catch (e) {
      return "null";
    }
  }
}
