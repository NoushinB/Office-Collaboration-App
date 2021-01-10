import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_asstes.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 5,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child:
      Row(
        children: [
          SizedBox(
            height: height / 5,
            width: height/5,
            child: Card(
              elevation: 0.0,
              child: Image.asset(AppAssets.appLogo),
            ),
          ),
        ],
      )
    );
  }
}
