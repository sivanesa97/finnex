import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
   AccountState createState() => AccountState();
}

class AccountState extends State<AccountPage> {
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountPage()));
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