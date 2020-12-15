import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, Widget bottom, BuildContext context})
      : super(key: key, 
        backgroundColor: Theme.of(context).primaryColor,
        bottom: bottom,
        title: title,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.short_text),
          onPressed: () {},
        ),
        centerTitle: true,
        actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.notifications_none),
          onPressed: () => print('100'),
        )
      ]);
}

class MyAppBarAddCat extends AppBar {
  MyAppBarAddCat({Key key, Widget title, Widget bottom, BuildContext context})
      : super(key: key, 
        backgroundColor: Color.fromRGBO(42, 54, 50, 1.0),
        bottom: bottom,
        title: title,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
  );
}
