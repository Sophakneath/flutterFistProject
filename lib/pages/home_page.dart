import 'package:MyApp/customs/header.dart';
import 'package:MyApp/customs/transaction_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> itemData = [];
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  void getData() {
    itemData.add(TransactionCard());
    itemData.add(TransactionCard());
    itemData.add(TransactionCard());
    itemData.add(TransactionCard());
    itemData.add(TransactionCard());
    setState(() {
      return itemData;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      double value = controller.offset / 500;

      setState(() {
        topContainer = value;
        // closeTopContainer = controller.offset > 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Container(
            child: Column(
          children: <Widget>[
            Header(),
            Expanded(
                child: ListView.builder(
              itemCount: itemData.length,
              itemBuilder: (context, index) {
                return itemData[index];
              },
            ))
          ],
        )),
      ),
    );
  }
}
