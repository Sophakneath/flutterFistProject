import 'package:MyApp/core/flutter_icons.dart';
import 'package:MyApp/widgets/chart_widget.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Function addTransaction;

  const Header(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);

    return Container(
        width: double.infinity,
        height: mediaQuery.size.height * .5,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildStatistic(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     OutlineButton(
              //       onPressed: addTransaction,
              //       borderSide: const BorderSide(width: 1, color: Colors.white),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(24)),
              //       child: Container(
              //         width: 124,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             const Icon(
              //               Icons.playlist_add,
              //               color: Colors.white,
              //             ),
              //             const SizedBox(width: 4),
              //             const Text(
              //               'Add Transaction',
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     FlatButton(
              //       onPressed: () {},
              //       color: Colors.white,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(24)),
              //       child: Container(
              //         width: 72,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Text(
              //               'Reports',
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 color: primaryColor,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             Icon(
              //               Icons.navigate_next,
              //               color: primaryColor,
              //             ),
              //           ],
              //         ),
              //       ),
              //     )
              //   ],
              // ),
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
        ));
  }

  Widget _buildStatistic() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(5),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 160,
                  height: 160,
                  child: DonutPieChart.withSampleData(),
                ),
                Container(
                  width: 70,
                  height: 70,
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
                _buildStatisticItem(
                    Colors.blueAccent, "Income", "23,29,539"),
                _buildStatisticItem(
                    Colors.redAccent, "Expense", "5,92,229"),
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
            padding: const EdgeInsets.only(right:10),
            child: Icon(
                  Icons.circle,
                  size: 20,
                  color: color,
                ),
          ),
          SizedBox(height: 50),
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
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ],
          ),
        ],
    );
  }
}
