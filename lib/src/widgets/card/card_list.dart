import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_asstes.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class CardList extends StatelessWidget {
  final double height;
  CardList({@required this.height=80});
  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      child: InkWell(
        child: Card(
          color: AppColors.lightPrimaryColor,
          elevation: 1,
          child: Row(
            children: [
              Container(
                child: Image.asset(AppAssets.appLogo),
                height: 80,
                width: 120,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
