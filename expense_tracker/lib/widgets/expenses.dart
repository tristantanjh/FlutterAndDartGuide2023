import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Lunch',
      amount: 12.34,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _addNewExpense() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(
          onPressed: _addNewExpense,
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(_registeredExpenses),
          ),
        ],
      ),
    );
  }
}
