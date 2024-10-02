import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();
  double _monthlyPayment = 0.0;

  int _loanMonths = 1;

  void _calculateMonthlyPayment() {
    final double amount = double.tryParse(_amountController.text) ?? 0;
    final double percentage = double.tryParse(_percentageController.text) ?? 0;

    if (amount <= 100) {
      _showErrorDialog('Amount must be greater than 100.');
      return;
    }
    if (percentage < 0 || percentage > 100) {
      _showErrorDialog('Percentage must be between 0 and 100 inclusive.');
      return;
    }

    if (amount > 0 && percentage > 0) {
      double monthlyInterestRate = percentage / 100 / 12;
      double denominator =
          (1 - pow(1 + monthlyInterestRate, -_loanMonths).toDouble());
      setState(() {
        _monthlyPayment = (amount * monthlyInterestRate) / denominator;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Input Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Loan Calculator',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Enter amount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        hintText: 'Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Number of months',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('1 month'),
                        Expanded(
                          child: Slider(
                            value: _loanMonths.toDouble(),
                            min: 1,
                            max: 36,
                            divisions: 35,
                            label: '$_loanMonths months',
                            thumbColor: Colors.blue,
                            activeColor: Colors.blue,
                            onChanged: (double newValue) {
                              setState(() {
                                _loanMonths = newValue.toInt();
                              });
                            },
                          ),
                        ),
                        const Text('36 months'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Enter percentage',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _percentageController,
                      decoration: const InputDecoration(
                        hintText: 'Percent',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'You will pay the approximate amount monthly:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${_monthlyPayment.toStringAsFixed(2)} lei',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _calculateMonthlyPayment,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              child: const Text('Calculate',
                  style: TextStyle(fontSize: 22, color: Colors.white)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
