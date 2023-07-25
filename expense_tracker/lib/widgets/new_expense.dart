import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense(this.onAddExpense, {super.key});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime? _chosenDate;
  Category _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final timeNow = DateTime.now();
    final firstDate = DateTime(timeNow.year - 1, timeNow.month, timeNow.day);

    final userDate = await showDatePicker(
      context: context,
      initialDate: timeNow,
      firstDate: firstDate,
      lastDate: timeNow,
    );

    setState(() {
      _chosenDate = userDate;
    });
  }

  void _displayDialogOnPlatform() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure a valid title, amount, date, and category was entered!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  )
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure a valid title, amount, date, and category was entered!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  )
                ],
              ));
    }
  }

  void _submitExpense() {
    final enteredTitle = _titleController.text;
    final enteredPrice = double.tryParse(_priceController.text);
    if (enteredTitle.trim().isEmpty ||
        enteredPrice == null ||
        enteredPrice <= 0 ||
        _chosenDate == null) {
      _displayDialogOnPlatform();
      return;
    }

    widget.onAddExpense(
      Expense(
          title: enteredTitle,
          amount: enteredPrice,
          date: _chosenDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: ((ctx, constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, spacing + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title Of Expense'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}'))
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            prefixText: '\$ ',
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title Of Expense'),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item.name.toUpperCase()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const Spacer(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_chosenDate == null
                                ? 'Select Date'
                                : formatter.format(_chosenDate!)),
                            IconButton(
                              onPressed: _showDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}'))
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            prefixText: '\$ ',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_chosenDate == null
                                ? 'Select Date'
                                : formatter.format(_chosenDate!)),
                            IconButton(
                              onPressed: _showDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpense,
                        child: const Text('Save Expense'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item.name.toUpperCase()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpense,
                        child: const Text('Save Expense'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
