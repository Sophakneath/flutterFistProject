import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ 
        ListTile(
          leading: Container(
            child: Icon(
              transaction.iconData,
              size: 25,
              color: transaction.color,
            ),
          ),
          title: Text(
            transaction.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            transaction.category,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text(
            '\$${transaction.value}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]
    );
  }
}
