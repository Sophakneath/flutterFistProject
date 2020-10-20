import 'package:MyApp/pages/home_page.dart';
import 'package:MyApp/pages/setting_page.dart';
import 'package:MyApp/pages/statistic_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

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
          home: MyHomePage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: _2A3638,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  var _pages = [HomePage(), Statistic(), Setting()];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.short_text),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'Transaction',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Moutserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.person_outline), onPressed: () {})
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(_selectedIndex,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home), title: Text("Home"), activeColor: color),
          BottomNavyBarItem(
              icon: Icon(Icons.pie_chart),
              title: Text("Statistic"),
              activeColor: color),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text("Setting"),
              activeColor: color),
          BottomNavyBarItem(
              icon: Icon(Icons.star),
              title: Text("Rate Us"),
              activeColor: color),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text("About Us"),
              activeColor: color)
        ],
        animationDuration: Duration(milliseconds: 200),
      ),
    );
  }
}
