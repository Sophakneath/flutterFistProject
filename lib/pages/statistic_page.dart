// import 'package:MyApp/pages/expense_statistic_page.dart';
// import 'package:MyApp/pages/income_statistic_page.dart';
import 'package:MyApp/widgets/app_bar_widget.dart';
import 'package:MyApp/widgets/date_header.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistic extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Statistic> {
  Color color = Colors.transparent;
  // bool _isIncomeTap = true;
  // bool _isExpenseTap = false;
  // int _selectedIndex = 1;
  // var _pages = [IncomeStatistic(), ExpenseStatistic()];
  // var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Flutter": 5,
      "React": 3,
      "Xamarin": 2,
      "Ionic": 2,
      "Abc": 1,
    };

    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: const Text(
          'Statistic',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Moutserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(2),
            // child: _buildTabBar()
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DateHeader(),
                // _buildTabBar(),
                SizedBox(
                  height: 40,
                ),
                _buildPiechartData(dataMap),
                SizedBox(
                  height: 40,
                ),
                _buildDataDetail("Income List"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPiechartData(var dataMap) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 60,
      chartRadius: MediaQuery.of(context).size.width / 2,
      // colorList: colorList,
      initialAngleInDegree: 0,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        showLegends: false,
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
      ),
    );
  }

  Widget _buildDataDetail(var listname) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              listname,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            _buildDataItem("Food", Colors.blueAccent),
            _buildDataItem("Ohter", Colors.redAccent),
            _buildDataItem("Service", Colors.greenAccent)
          ]),
    );
  }

  Widget _buildDataItem(var name, var color) {
    return Column(children: <Widget>[
      ListTile(
        leading: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.all(6),
            child: Text(
              "23.1%",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          '\$${100}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}
