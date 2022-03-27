import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finnex/ExpenseTabs.dart';
import 'package:finnex/auth/SignIn.dart';
import 'package:finnex/src/screen/Accounttrack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  Widget build(BuildContext context) {
    List<String> Account = <String>[];
    QuerySnapshot? snap;
    List<double> Balance = <double>[];
    String uid;
    Future<QuerySnapshot> updateData() {
      uid = FirebaseAuth.instance.currentUser.uid;
      return FirebaseFirestore.instance
          .collection("expenses")
          .doc(uid)
          .collection("transactions")
          .get()
          .then((QuerySnapshot value) => snap = value);
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expense'),
            iconTheme: IconThemeData(size: 20, color: Colors.white),
            elevation: 0.0,
            backgroundColor: Colors.black87,
          ),
          drawerEnableOpenDragGesture: true,
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .black87, //This will change the drawer background to blue.
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
          body: FutureBuilder(
              future: updateData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 0),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.white,
                        borderOnForeground: true,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.money),
                              title: Text(snap!.docs[index].data()["bank"],
                                  style: TextStyle(color: Colors.green)),
                              subtitle: Text(
                                "\n" +
                                    snap!.docs[index]
                                        .data()["amount"]
                                        .toString() +
                                    "\n" +
                                    snap!.docs[index].data()["type"].toString(),
                                style: TextStyle(color: Colors.orangeAccent),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const SizedBox(width: 4),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                  iconSize: 25,
                                  color: Colors.red,
                                  splashColor: Colors.grey,
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              })),
    );
  }
}
