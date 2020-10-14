import 'package:MyApp/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './providers/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Map<int, Color> colorMap = {
    50: Color.fromRGBO(42, 54, 50, 0.1),
    100: Color.fromRGBO(42, 54, 50, 0.2),
    200: Color.fromRGBO(42, 54, 50, 0.3),
    300: Color.fromRGBO(42, 54, 50, 0.4),
    400: Color.fromRGBO(42, 54, 50, 0.5),
    500: Color.fromRGBO(42, 54, 50, 0.6),
    600: Color.fromRGBO(42, 54, 50, 0.7),
    700: Color.fromRGBO(42, 54, 50, 0.8),
    800: Color.fromRGBO(42, 54, 50, 0.9),
    900: Color.fromRGBO(42, 54, 50, 1.0),
  };

  static const MaterialColor _2A3638 = MaterialColor(0xFF2A3638, colorMap);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Transactions(),
      child: MaterialApp(
        title: 'Flutter App',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: _2A3638,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.cyan,
      //   title: Text(
      //     'Flutter App',
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.cyan,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.cyan,
        height: 50,
        items: <Widget>[
          Icon(Icons.dashboard, size: 20, color: Colors.white),
          Icon(Icons.category_rounded, size: 20, color: Colors.white),
          Icon(Icons.money_off_sharp, size: 30, color: Colors.white),
          Icon(Icons.star, size: 20, color: Colors.white),
          Icon(Icons.more_horiz, size: 20, color: Colors.white),
        ],
        index: 2,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          debugPrint("$index");
        },
      ),
    );
  }
}
