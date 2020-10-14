import 'package:MyApp/customs/header.dart';
import 'package:MyApp/customs/transaction_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = .55;

  void _addTransaction() {
    setState(() {
      _height = .8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.short_text),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'Transaction',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Moutserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_outline), 
            onPressed: () {}
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Header(_addTransaction),
            ],
          ),
          TransactionCard(_height),
        ],
      ),
    );
  }
}
