import 'package:finnex/expenseTrack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:finnex/src/Dashboard.dart';
import 'package:finnex/profile.dart';
import 'package:finnex/search.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: ExpensePage(),
          icon: Icon(Icons.account_balance),
          title: Text("Income"),
        ),
        TabNavigationItem(
          page: ExpensePage(),
          icon: Icon(Icons.shopping_bag),
          title: Text("Expense"),
        ),
        TabNavigationItem(
          page: ExpensePage(),
          icon: Icon(Icons.credit_card),
          title: Text("Transfers"),
        ),
      ];
}
