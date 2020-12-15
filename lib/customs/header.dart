import 'package:MyApp/widgets/chart_widget.dart';
import 'package:MyApp/widgets/date_header.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  // final Function addTransaction;

  // const Header(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DateHeader(),
            _buildStatistic(),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10),
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
      ),
    );
  }

  Widget _buildStatistic() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(7),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: DonutPieChart.withSampleData(),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildStatisticItem(Colors.blueAccent, "Income", "23,29,539"),
                _buildStatisticItem(Colors.redAccent, "Expense", "5,92,229"),
                _buildStatisticItem(Colors.white, "Total", "1,60,717"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem(Color color, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            Icons.circle,
            size: 18,
            color: color,
          ),
        ),
        SizedBox(height: 47),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 1),
            Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
