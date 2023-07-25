import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/screens/new_expense.dart';
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

  void _showNewExpenseModal() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(_addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted!'),
        action: SnackBarAction(
          label: 'Undo?',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget displayedContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      displayedContent = ExpensesList(_registeredExpenses, _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(
          onPressed: _showNewExpenseModal,
          icon: const Icon(Icons.add),
        )
      ]),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: displayedContent,
                ),
              ],
            )
          : Row(children: [
              Expanded(child: Chart(expenses: _registeredExpenses)),
              Expanded(
                child: displayedContent,
              ),
            ]),
    );
  }
}
