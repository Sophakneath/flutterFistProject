import 'package:MyApp/models/categoryItem.dart';
import 'package:flutter/material.dart';
import 'category_list.dart';

class ExpenseCategory extends StatelessWidget {
  const ExpenseCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<CategoryItem> items = [
      CategoryItem('Food', '0xe868', Colors.red),
      CategoryItem('Health', '0xe867', Colors.blue),
      CategoryItem('Transportation', '0xe86c', Colors.yellow),
      CategoryItem('Entertainment', '0xe86d', Colors.pink),
      CategoryItem('Sport', '0xe86e', Colors.cyan),
      CategoryItem('Travel', '0xe863', Colors.brown),
      CategoryItem('Gift', '0xe862', Colors.orange),
      CategoryItem('Beauty', '0xe861', Colors.green),
      CategoryItem('Education', '0xe86f', Colors.amber),
      CategoryItem('Shopping', '0xe85e', Colors.purple),
      CategoryItem('Household', '0xe871', Colors.purple),
      CategoryItem('Service', '0xe870', Colors.purple),
      CategoryItem('Other', '0xe869', Colors.purple),
    ];

    return Scaffold(
      body: CategoryList(items: items),
    );
  }
}