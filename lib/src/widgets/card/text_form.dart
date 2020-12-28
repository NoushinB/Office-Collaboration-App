import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class TextForm extends StatelessWidget {
  final IconData icon;
  final String label;

  TextForm(this.icon,this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      child: Card(
        color: AppColors.lightPrimaryColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: AppColors.lightPrimaryColor, width: 3)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  textAlign: TextAlign.right,
                  initialValue: ' ',
                  decoration: InputDecoration(
                    focusColor: AppColors.lightPrimaryColor,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    icon: Icon(icon,color: AppColors.darkPrimaryColor,),
                    labelText: label,
                    labelStyle: TextStyle(color: AppColors.darkPrimaryColor)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
