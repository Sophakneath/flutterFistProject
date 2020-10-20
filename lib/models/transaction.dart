import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final double value;
  final String category;
  final IconData iconData;
  final Color color;

  const Transaction(
      {@required this.id,
      @required this.title,
      @required this.value,
      @required this.category,
      @required this.iconData,
      @required this.color});
}

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(id: 1, title: 'Dinner', value: 129, category: "Social Life", iconData: Icons.person, color: Colors.red),
    Transaction(id: 1, title: 'Grocery', value: 129, category: "Food", iconData: Icons.fastfood, color: Colors.blue),
    Transaction(id: 1, title: 'Lunch', value: 129, category: "Household", iconData: Icons.house, color: Colors.cyan),
  ];

  List<Transaction> get transactions{
    return _transactions;
  }
}
