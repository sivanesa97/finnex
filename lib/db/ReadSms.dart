import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms/sms.dart';

class ReadSms {
  String get uid {
    return FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser.uid
        : "";
  }

  Future<List> get messages async {
    List list = [];
    List id = [];
    List body = [];
    List type = [];
    List address = [];
    List bank = [];
    List date = [];
    List amount = [];
    double credited = 0.00;
    double debited = 0.00;
    List banks = [];
    SmsQuery query = new SmsQuery();
    list = await query.getAllSms;
    if (uid != null && uid != "") {
      list.forEach((element) {
        if (element.address.toString().contains("SBI")) {
          print(element.body);
          print(element.address);
        }
        if (element.address.toString().contains("BOBTXN") &&
            element.body.toString().contains("Credited") &&
            element.kind == SmsMessageKind.Received) {
          credited = credited +
              double.parse(
                  element.body.toString().split("Rs.")[1].split(" ")[0]);
          id.add(element.id.toString());
          body.add(element.body.toString());
          date.add(element.date.toString());
          type.add("Credit");
          address.add(element.address.toString());
          bank.add("BOB");
          amount.add(double.parse(
              element.body.toString().split("Rs.")[1].split(" ")[0]));
          print(element.id);
        }
        if (element.address.toString().contains("BOBTXN") &&
            element.body.toString().contains("Debited") &&
            element.kind == SmsMessageKind.Received) {
          debited = debited +
              double.parse(
                  element.body.toString().split("Rs.")[1].split(" ")[0]);

          id.add(element.id.toString());
          body.add(element.body.toString());
          date.add(element.date.toString());
          type.add("Debit");
          address.add(element.address.toString());
          bank.add("BOB");
          amount.add(double.parse(
              element.body.toString().split("Rs.")[1].split(" ")[0]));
        }
        if (element.address.toString().contains("BOBTXN") &&
            element.body.toString().contains("withdrawn") &&
            element.kind == SmsMessageKind.Received) {
          debited = debited +
              double.parse(
                  element.body.toString().split("Rs.")[1].split(" ")[0]);

          id.add(element.id.toString());
          body.add(element.body.toString());
          date.add(element.date.toString());
          type.add("Debit");
          address.add(element.address.toString());
          bank.add("BOB");
          amount.add(double.parse(
              element.body.toString().split("Rs.")[1].split(" ")[0]));
        }
        if (element.address.toString().contains("BOBTXN") &&
            element.body.toString().contains("transferred") &&
            element.kind == SmsMessageKind.Received) {
          debited = debited +
              double.parse(
                  element.body.toString().split("Rs.")[1].split(" ")[0]);

          id.add(element.id.toString());
          body.add(element.body.toString());
          date.add(element.date.toString());
          type.add("Debit");
          address.add(element.address.toString());
          bank.add("BOB");
          amount.add(double.parse(
              element.body.toString().split("Rs.")[1].split(" ")[0]));
        }
      });
      bool exist = false;
      var snap = await FirebaseFirestore.instance
          .collection("expenses")
          .doc(uid)
          .collection("transactions")
          .get();
      for (int i = 0; i < id.length; i++) {
        snap.docs.forEach((element) {
          if (element.id.toString() == id[i]) {
            exist = true;
          }
        });

        if (!exist) {
          await FirebaseFirestore.instance
              .collection("expenses")
              .doc(uid)
              .collection("transactions")
              .doc(id[i])
              .set({
            'id': id[i],
            'body': body[i],
            'amount': amount[i],
            'type': type[i],
            'address': address[i],
            'date': date[i],
            'bank': bank[i],
            'verify': 'pending'
          });
        }
        exist = false;
      }
      ;
    }
    list.forEach((element) {});
    return list;
  }
}
