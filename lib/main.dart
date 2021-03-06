import 'package:finnex/auth/SignIn.dart';
import 'package:finnex/src/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:finnex/db/ReadSms.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ReadSms().messages.then((value) => {print(value.iterator)});
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nexa',
        primaryIconTheme: IconThemeData(color: Colors.black),
      ),
      home: _auth.currentUser != null ? Dashboard() : SignIn(),
    );
  }
}
