import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SmsPermission extends StatefulWidget {
  @override
  SmsState createState() => SmsState();
}

class SmsState extends State<SmsPermission> {
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
              SizedBox(height: 490),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.00)),
                height: 45.0,
                minWidth: 150.0,
                // color: Theme.of(context).primaryColorDark,
                textColor: Colors.black,
                color: Colors.white,
                child: new Text("Allow"),
                onPressed: () async {
                  var status = await Permission.sms.status;
                  if (status.isGranted) {
                  } else {
                    Map<Permission, PermissionStatus> statuses = await [
                      Permission.sms,
                    ].request();
                    statuses.forEach((key, value) {
                      print(key.status);
                    });
                  }
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SmsPermission()));
                },
              ),
            ],
          )),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/sms.gif"), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
