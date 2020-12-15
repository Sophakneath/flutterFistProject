import 'package:MyApp/core/menu_icons_icons.dart';
import 'package:MyApp/pages/categories.dart';
import 'package:MyApp/pages/home_page.dart';
import 'package:MyApp/pages/rating_page.dart';
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
            primaryColor: _2A3638,
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
  var _pages = [HomePage(), Statistic(), CategoriesPage(), SettingPage(), RatingPage()];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
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
          _pageController.jumpToPage(_selectedIndex,
              );
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(MenuIcons.book_of_black_cover_closed, size: 20,),
              title: Text("Transaction"),
              activeColor: color),
          BottomNavyBarItem(
              icon: Icon(MenuIcons.pie_chart, size: 20,),
              title: Text("Statistic"),
              activeColor: color),
          BottomNavyBarItem(
              icon: Icon(MenuIcons.dashboard, size: 20,),
              title: Text("Categories"),
              activeColor: color),
          BottomNavyBarItem(
              icon: Icon(MenuIcons.settings, size: 20,),
              title: Text("Settings"),
              activeColor: color),
          BottomNavyBarItem(
              icon: Icon(MenuIcons.star, size: 20,),
              title: Text("Rate Us"),
              activeColor: color)
        ],
        animationDuration: Duration(milliseconds: 200),
      ),
    );
  }

}
