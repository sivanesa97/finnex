import 'package:finnex/ExpenseTabs.dart';
import 'package:finnex/auth/SignIn.dart';
import 'package:finnex/expenseTrack.dart';
import 'package:finnex/src/screen/Accounttrack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finnex/side_menu.dart';
import 'package:finnex/auth/smsPermission.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

void initState() async {
  List messages = [];
  SmsQuery query = new SmsQuery();
  await query.getAllSms.then((value) => {});
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Dashboard"),
        iconTheme: IconThemeData(size: 20, color: Colors.white),
        elevation: 0.0,
        backgroundColor: Colors.black87,
      ),
      drawerEnableOpenDragGesture: true,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Colors.black87, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset('images/finnex_logo.png'),
              ),
              ListTile(
                title: Text(
                  'Accounts',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountPage()));
                },
                leading: Icon(
                  Icons.account_balance,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Expenses',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpenseTab(
                                selectedIndex: 1,
                              )));
                },
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Debts',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Savings',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.savings,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  FirebaseAuth.instance.signOut(),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()))
                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
