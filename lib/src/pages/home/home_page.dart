import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'fragments/add_new_house.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> _fragments = [
    AddNewHouse(),
    AddNewHouse(),
    AddNewHouse(),
    AddNewHouse(),
    AddNewHouse(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _fragments[_currentIndex]),
      bottomNavigationBar:  new Theme(
        data: Theme.of(context).copyWith(
      // sets the background color of the `BottomNavigationBar`
        canvasColor: AppColors.primaryColor,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: AppColors.secondaryColor,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: AppColors.darkPrimaryColor))), // sets the inactive color of the `BottomNavigationBar`
    child: new BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: 0,



        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.offline_bolt_outlined), label: "Offers"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    ),
    );
  }
}
