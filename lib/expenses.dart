import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widget/expense_list/expenses_list.dart';
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

  void _openAddExpense() {
    showModalBottomSheet(context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: _openAddExpense,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            const Text('The chart'),
            Expanded(
                child: ExpensesList(expenses: _registeredExpenses)
            ),
          ],
        )
      );
  }
}