import 'package:flutter/material.dart';
import 'package:finnex/bottom_tabs.dart';

class ExpenseTab extends StatefulWidget {
  int selectedIndex = 0;

  ExpenseTab({required this.selectedIndex});

  @override
  _ExpenseTabState createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _selectedIndex = widget.selectedIndex;
      print(_selectedIndex);
    });
  }

  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Income',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Transfers',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
