import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> Account = [];
  List<String> Balance = [];
  @override
  Widget build(BuildContext context) {
    TextEditingController input_accountName = TextEditingController();
    TextEditingController input_balance = TextEditingController();
    initState() {
      Account = <String>['SBI', 'IOB', 'Indain Bank', 'BOB'];
      Balance = <String>["1,200", "4,000", "50,000", "2,00,000"];
    }

    ;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Finnex'),
        ),
        body: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: Account.length,
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
                    title: Text("${Account[index]}",
                        style: TextStyle(color: Colors.green)),
                    subtitle: Text(
                      "${Balance[index]}",
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
                        onPressed: () {
                          setState(() {
                            Account.removeAt(index);
                            Balance.removeAt(index);
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            showModalBottomSheet<void>(
              // context and builder are
              // required properties in this widget
              context: context,
              builder: (BuildContext context) {
                // we set up a container inside which
                // we create center column and display text
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: input_accountName,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter Account name',
                          labelText: 'Account Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: input_balance,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.money),
                          hintText: 'Amount of Balance',
                          labelText: 'Balance',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter valid Balance';
                          }
                          return null;
                        },
                      ),
                      new Container(
                          padding: const EdgeInsets.only(left: 60.0, top: 40.0),
                          child: new RaisedButton(
                            child: const Text('Save'),
                            onPressed: () {
                              print(_formKey.currentState);
                              // Account.add()
                              // It returns true if the form is valid, otherwise returns false
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                setState(() {
                                  Account.add(input_accountName.text);
                                  Balance.add(input_balance.text);
                                });
                              }
                            },
                          )),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
