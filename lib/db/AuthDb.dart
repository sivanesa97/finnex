import 'package:firebase_auth/firebase_auth.dart';

class AuthDb {
  String get uiD {
    try {
      var userId;
      FirebaseAuth.instance
          .currentUser()
          .then((FirebaseUser user) => {userId = user.uid});
      return userId;
    } catch (e) {
      return "null";
    }
  }
}
