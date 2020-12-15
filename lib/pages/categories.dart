import 'package:MyApp/pages/add_cat.dart';
import 'package:MyApp/widgets/app_bar_widget.dart';
import 'package:MyApp/widgets/expense_category.dart';
import 'package:MyApp/widgets/income_category.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {

  @override
  Widget build(BuildContext context) {
    String title = "Income";
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MyAppBar(
            context: context,
            title: const Text(
              'Categories',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Moutserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: TabBar(
              onTap: (value) {
                if (value == 0)
                  title = "Income";
                else
                  title = "Expense";
              },
              indicatorColor: Colors.blue[200],
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: "Income",
                  // icon: Icon(Icons.inbox),
                ),
                Tab(
                  text: "Expense",
                  // icon: Icon(Icons.outbox),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[IncomeCategory(), ExpenseCategory()],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black45,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCat(title: title,)),
              );
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
