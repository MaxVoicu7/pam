import 'package:flutter/material.dart';
import 'package:test_dart/pages/calculator_page/calculator_page.dart';
import 'package:test_dart/pages/loan_list_page/loan_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;

  static const List<Widget> _pages = <Widget>[
    CalculatorPage(),
    LoanListPage(),
  ];

  // Handles bottom navigation bar tap
  void _onPageSelected(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_sharp),
            label: 'Loan Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Loan List',
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.blueAccent,
        onTap: _onPageSelected,
      ),
    );
  }
}
