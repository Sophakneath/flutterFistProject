import 'package:MyApp/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  RatingPage({Key key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: const Text(
          'Rating',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Moutserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}