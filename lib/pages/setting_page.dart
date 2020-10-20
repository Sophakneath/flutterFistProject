import 'package:MyApp/customs/header.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<Setting> {
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
            // Expanded(
            //     child: ListView.builder(
            //   itemCount: itemData.length,
            //   itemBuilder: (context, index) {
            //     return itemData[index];
            //   },
            // ))
          ],
        )),
      ),
    );
  }
}