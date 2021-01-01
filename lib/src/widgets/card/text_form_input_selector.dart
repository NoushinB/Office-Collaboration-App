import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class TextFormInputSelector extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback callback;

  TextFormInputSelector({
    this.icon,
    this.label,
    this.value = "Select...",
    this.callback
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 76,
        child: Card(
          color: AppColors.lightPrimaryColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: AppColors.lightPrimaryColor, width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Icon(icon, color: AppColors.darkPrimaryColor),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkPrimaryColor)),
                    SizedBox(height: 4),
                    Text(value)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: (){
        if(callback != null){
          callback();
        }
      },
    );
  }
}
