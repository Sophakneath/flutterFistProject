import 'package:MyApp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'expense_chart.dart';

class Header extends StatelessWidget {
  final Function addTransaction;

  const Header(this.addTransaction);

  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense, String>(
      id: 'Expense',
      domainFn: (Expense expense, _) => expense.category,
      measureFn: (Expense expense, _) => expense.value,
      labelAccessorFn: (Expense expense, _) => '\$${expense.value}',
      colorFn: (Expense expense, _) =>
          charts.ColorUtil.fromDartColor(expense.color),
      data: [
        Expense('Business', 130.99, Color(0xff40bad5)),
        Expense('Meals', 130.99, Color(0xffe8505b)),
        Expense('Gifts', 130.99, Color(0xfffe91ca)),
        Expense('Gaming', 130.99, Color(0xfff6d743)),
        Expense('Entertainment', 130.99, Color(0xfff57b51)),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);

    return Container(
        width: double.infinity,
        height: mediaQuery.size.height * .5,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                child: ExpenseChart(_series, animate: true),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  OutlineButton(
                    onPressed: addTransaction,
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: 124,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Add Transaction',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Reports',
                            style: TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: const Text(
                  'Transactions',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
