import 'package:MyApp/core/menu_icons_icons.dart';
import 'package:MyApp/customs/header.dart';
import 'package:MyApp/customs/transaction_card.dart';
import 'package:MyApp/widgets/app_bar_widget.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: const Text(
          'Transaction',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Moutserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
          color: Theme.of(context).primaryColor,
          child: NestedScrollView(
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  collapsedHeight: 250,
                  expandedHeight: 250,
                  flexibleSpace: Header(),
                )
              ];
            }, 
            body: Container(
                child: ListView.builder(
                itemCount: itemData.length,
                itemBuilder: (context, index) {
                  return itemData[index];
                },
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(MenuIcons.plus, size: 18,),
      ),
    );
  }
}
