import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenseList, this.onRemoveExpense, {super.key});

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // to dynamically generate long lists
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenseList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.8),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) => onRemoveExpense(expenseList[index]),
        child: ExpensesItem(
          expenseList[index],
        ),
      ),
    );
  }
}
