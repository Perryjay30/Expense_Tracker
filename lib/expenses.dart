import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Expenses extends StatefulWidget {
  Expenses({super.key});

  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
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