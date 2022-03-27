import 'package:finnex/auth/smsPermission.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

@override
void initState() async {
  List messages = [];
  SmsQuery query = new SmsQuery();
  await query.getAllSms.then((value) => {print(value.length)});
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}
