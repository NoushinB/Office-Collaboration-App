import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class TextForm extends StatelessWidget {
  final IconData icon;

  TextForm(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: AppColors.lightPrimaryColor, width: 3)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                initialValue: ' ',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  icon: Icon(icon),
                  labelText: 'UserName/Email',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
