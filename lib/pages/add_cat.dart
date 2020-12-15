import 'dart:math';
import 'package:MyApp/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class AddCat extends StatefulWidget {
  final String title;
  AddCat({Key key, @required this.title}) : super(key: key);

  @override
  _AddCatState createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
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
    var title = widget.title;
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: _2A3638,
        primaryColor: Color.fromRGBO(42, 54, 50, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: MyAppBarAddCat(
          context: context,
          title: Text(
            'Add $title Category',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Moutserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(child: GridViewBuilder()),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
          child: ButtonTheme(
            minWidth: 200,
            height: 40,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {},
              color: Color.fromRGBO(42, 54, 50, 1.0),
              textColor: Colors.white,
              child: Text('Add New Category'),
            ),
          ),
        ),
      ),
    );
  }
}

class GridViewBuilder extends StatefulWidget {
  GridViewBuilder({Key key}) : super(key: key);

  @override
  _GridViewBuilderState createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  final List<String> icons = [
    '0xe850',
    '0xe84f',
    '0xe84e',
    '0xe802',
    '0xe800',
    '0xe803',
    '0xe804',
    '0xe805',
    '0xe806',
    '0xe807',
    '0xe808',
    '0xe809',
    '0xe80a',
    '0xe80b',
    '0xe80c',
    '0xe80d',
    '0xe80e',
    '0xe80f',
    '0xe810',
    '0xe811',
    '0xe812',
    '0xe813',
    '0xe814',
    '0xe815',
    '0xe816',
    '0xe817',
    '0xe818',
    '0xe819',
    '0xe81a',
    '0xe81b',
    '0xe81c',
    '0xe81d',
    '0xe81e',
    '0xe81f',
    '0xe820',
    '0xe821',
    '0xe822',
    '0xe823',
    '0xe824',
    '0xe825',
    '0xe826',
    '0xe827',
    '0xe828',
    '0xe829',
    '0xe82a',
    '0xe82b',
    '0xe82c',
    '0xe82d',
    '0xe82e',
    '0xe831',
    '0xe832',
    '0xe833',
    '0xe834',
    '0xe835',
    '0xe836',
    '0xe837',
    '0xe838',
    '0xe839',
    '0xe83a',
    '0xe83b',
    '0xe83c',
    '0xe83d',
    '0xe83e',
    '0xe83f',
    '0xe840',
    '0xe841',
    '0xe842',
    '0xe843',
    '0xe844',
    '0xe845',
    '0xe846',
    '0xe847',
    '0xe849',
    '0xe84a',
    '0xe84b',
    '0xe84c',
    '0xe84d'
  ];

  final _controller = TextEditingController();
  bool _isSelected = true;
  List colors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.tealAccent,
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.amber,
    Colors.pinkAccent,
    Colors.greenAccent,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.orangeAccent,
    Colors.brown,
    Colors.indigoAccent
  ];
  Random random = new Random();
  int colIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTextBox(_controller, icons, colors, colIndex, currentIndex),
        _buildTextView(),
        GridView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            itemCount: icons.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      _isSelected = true;
                      colIndex = random.nextInt(13);
                      currentIndex = index;
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: _buildBoxDecoration(
                          _isSelected, colors, colIndex, currentIndex, index),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: _buildIcon(_isSelected, colIndex, currentIndex,
                              index, icons))));
            }),
      ],
    );
  }
}

Widget _buildTextView() {
  return Container(
    child: Text(
      "Icons",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  );
}

Widget _buildTextBox(TextEditingController _controller, var icons, var colors,
    var colIndex, var index) {
  return Container(
    margin: EdgeInsets.all(20),
    child: TextField(
      controller: _controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          prefixIcon: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: colors[colIndex],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  IconData(int.parse(icons[index]), fontFamily: 'ExpenseIcons'),
                  color: Colors.white,
                  size: 20,
                ),
              )),
          hintText: "Category Name",
          filled: true,
          fillColor: Colors.grey[200]),
    ),
  );
}

BoxDecoration _buildBoxDecoration(
    bool _isSelected, var colors, int colIndex, int currentIndex, int index) {
  if (currentIndex == index)
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: _isSelected ? colors[colIndex] : Colors.black12,
    );
  else
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.black12,
    );
}

Icon _buildIcon(
    bool _isSelected, int colIndex, int currentIndex, int index, var icons) {
  if (currentIndex == index)
    return Icon(
      IconData(int.parse(icons[index]), fontFamily: 'ExpenseIcons'),
      color: _isSelected ? Colors.white : Colors.black87,
      size: 20,
    );
  else
    return Icon(
      IconData(int.parse(icons[index]), fontFamily: 'ExpenseIcons'),
      color: Colors.black87,
      size: 20,
    );
}
