import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class Statistic extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Statistic> {
  TextStyle nameStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w700, color: Colors.grey, fontSize: 15);
  TextStyle amountStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700, color: Colors.black, fontSize: 16);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F6),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(color: Color(0xFF605BDD)),
            ),
          ),
          ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "OVERVIEW",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Here is a list of your Transactions",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                padding: EdgeInsets.all(13.0),
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
                height: 150,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios, size: 16,),
                        Text(
                          "July 2020",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16,)
                      ],
                    ),
                    SizedBox(
                      height: 28.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Expenses",
                          style: nameStyle,
                        ),
                        Text(
                          "Incomes",
                          style: nameStyle,
                        ),
                        Text(
                          "Balance",
                          style: nameStyle,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "28.00\$",
                          style: amountStyle,
                          
                        ),
                        Text(
                          "8.00\$",
                          style: amountStyle,
                        ),
                        Text(
                          "2.000\$",
                          style: amountStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.0,),

            ],
          )
        ],
      ),
    );
  }
}
