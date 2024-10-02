import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoanListPage extends StatefulWidget {
  const LoanListPage({super.key});

  @override
  State<LoanListPage> createState() => _LoanListPageState();
}

class _LoanListPageState extends State<LoanListPage> {
  List _loans = [];

  Future<void> loadLoans() async {
    final String response = await rootBundle.loadString('assets/loans.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      _loans = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLoans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _loans.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Loan List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _loans.length,
                    itemBuilder: (BuildContext context, int index) {
                      final loan = _loans[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Loan Amount: ${loan["amount"].toStringAsFixed(2)} lei',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text('Percentage: ${loan["percentage"]}%'),
                              const SizedBox(height: 10),
                              Text('Months: ${loan["months"]}'),
                              const SizedBox(height: 10),
                              Text(
                                'Monthly Payment: ${loan["monthlyPayment"].toStringAsFixed(2)} lei',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
