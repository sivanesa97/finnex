import 'package:finnex/src/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:finnex/auth/SmsPermission.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

class SignIn extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String userName = "";
  String password = "";
  bool invisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 470),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.00)),
                height: 45.0,
                minWidth: 150.0,
                // color: Theme.of(context).primaryColorDark,
                textColor: Colors.black,
                color: Colors.white,
                child: new Text("Sign In"),
                onPressed: () async {
                  var uid = FirebaseAuth.instance.currentUser.uid;
                  print(uid);
                  FirebaseAuth.instance.signOut();
                  GoogleSignInAccount account = await GoogleSignIn().signIn();
                  final GoogleSignInAuthentication? googleAuth =
                      await account.authentication;
                  final credential = GoogleAuthProvider.credential(
                    accessToken: googleAuth?.accessToken,
                    idToken: googleAuth?.idToken,
                  );
                  var status = await Permission.sms.status;
                  await FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) => {
                            if (value.user.uid != null)
                              {
                                if (status.isGranted)
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard()))
                                  }
                                else
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SmsPermission()))
                                  }
                              }
                          });
                },
              ),
            ],
          )),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.gif"), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
