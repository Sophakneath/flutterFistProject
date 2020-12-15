import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class DateHeader extends StatefulWidget {
  DateHeader({Key key}) : super(key: key);

  @override
  _DateHeaderState createState() => _DateHeaderState();
}

class _DateHeaderState extends State<DateHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.arrow_left,
            color: Colors.white,
          ),
          Text(
            "July 2020",
            style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}