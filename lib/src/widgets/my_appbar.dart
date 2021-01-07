import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class MyAppbar extends StatelessWidget {
  final String title;

  MyAppbar(this.title);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 48),
      child: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: AppColors.darkPrimaryColor),
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: TextStyle(color: AppColors.darkPrimaryColor),
        ),
      ),
    );
  }
}
