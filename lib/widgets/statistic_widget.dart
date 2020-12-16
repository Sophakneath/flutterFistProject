import 'package:MyApp/models/categoryItem.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'date_header.dart';

class StatisticWidget extends StatefulWidget {
  final List<CategoryItem> items;
  final String name;

  StatisticWidget({Key key, this.items, this.name}) : super(key: key);

  @override
  _StatisticWidgetState createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Flutter": 5,
      "React": 3,
      "Xamarin": 2,
      "Ionic": 2,
      "Abc": 1,
    };

    List<CategoryItem> items = widget.items;
    String name = widget.name;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                _buildPiechartData(dataMap),
                SizedBox(
                  height: 40,
                ),
                _buildDataDetail(name),
              ],
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
      margin: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 12),
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