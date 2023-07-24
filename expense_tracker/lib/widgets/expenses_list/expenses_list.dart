import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenseList, {super.key});

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // to dynamically generate long lists
        itemCount: expenseList.length,
        itemBuilder: (ctx, index) => ExpensesItem(expenseList[index]));
  }
}
