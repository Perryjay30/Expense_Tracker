import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/expense.dart';



class Expenses extends StatefulWidget {
  Expenses({super.key});

  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: 'IPhone 15', amount: 450000.00,
      date: DateTime.now(), category: Category.leisure,
    ),
    Expense(title: 'Macbook Pro', amount: 900000.00,
      date: DateTime.now(), category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('The chart'),
          Text('Expenses list...'),
        ],
      )
    );
  }
}