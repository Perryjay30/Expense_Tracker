import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expense_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // print(MediaQuery.of(context).size.height);
    Widget mainContent = const Center
      (child: Text('No Expenses found. Start adding some!'),);
    if(_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              style: TextStyle(color: Colors.white),
              'Expense Tracker'),
          actions: [
            IconButton(
              onPressed: _openAddExpense,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
         ),
        body: width < 600 ?
        Column(
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
                child: mainContent
            ),
          ],
        ) :
        Row(
            children: [
              Expanded(
                  child: Chart(expenses: _registeredExpenses),
              ),
              Expanded(
                child: mainContent
              ),
            ]
        ),
      );
  }
}