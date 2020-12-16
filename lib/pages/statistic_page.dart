import 'package:MyApp/models/categoryItem.dart';
import 'package:MyApp/widgets/app_bar_widget.dart';
import 'package:MyApp/widgets/date_header.dart';
import 'package:MyApp/widgets/statistic_widget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistic1 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Statistic1> with TickerProviderStateMixin {
  Color color = Colors.transparent;

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

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
      body: Container(
            color: Theme.of(context).primaryColor,
            // child: _buildTabBar()
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DateHeader(),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 30,
                    child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)
                        )
                      ),
                      tabs: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Tab(text: "Income"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Tab(text: "Expense"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        StatisticWidget(items: items, name: "Income List"),
                        StatisticWidget(items: items, name: "Expense List"),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   height: 40,
                  // ),
                  // _buildPiechartData(dataMap),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  // _buildDataDetail("Income List"),

                ],
              ),
            ),
          )
    );
  }

  Widget _buildPiechartData(var dataMap) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 60,
      chartRadius: MediaQuery
          .of(context)
          .size
          .width / 2,
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
      width: MediaQuery
          .of(context)
          .size
          .width,
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