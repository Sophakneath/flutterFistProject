import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction.dart';

import '../customs/transaction_item.dart';

class TransactionCard extends StatefulWidget {
  // final double height;

  // const TransactionCard(this.height);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<TransactionCard> {
  int _date = 16;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final providerTransactions = Provider.of<Transactions>(context);

    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 12),
        width: mediaQuery.size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Today, Jan 2019",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TransactionItem(providerTransactions.transactions[0]),
              Divider(color: Colors.black26,),
              TransactionItem(providerTransactions.transactions[1]),
              Divider(color: Colors.black26,),
              TransactionItem(providerTransactions.transactions[2]),
            ]
          )
        );
  }
}
