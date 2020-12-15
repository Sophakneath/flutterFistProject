import 'package:MyApp/customs/header.dart';
import 'package:MyApp/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: const Text(
          'Settings',
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