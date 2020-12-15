import 'package:MyApp/models/categoryItem.dart';
import 'package:MyApp/widgets/category_list.dart';
import 'package:flutter/material.dart';

class IncomeCategory extends StatelessWidget {
  const IncomeCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<CategoryItem> items = [
      CategoryItem('Allowance', '0xe85b', Colors.red),
      CategoryItem('Salary', '0xe85d', Colors.blue),
      CategoryItem('Refunds', '0xe856', Colors.yellow),
      CategoryItem('Investment', '0xe853', Colors.pink),
      CategoryItem('Award', '0xe854', Colors.cyan),
      CategoryItem('Lottery', '0xe855', Colors.brown),
      CategoryItem('Sale', '0xe86a', Colors.orange),
      CategoryItem('Grants', '0xe86b', Colors.green),
      CategoryItem('Rental', '0xe85c', Colors.amber),
      CategoryItem('Other', '0xe869', Colors.purple),
    ];

    return Scaffold(
      body: CategoryList(items: items),
    );
  }
}
