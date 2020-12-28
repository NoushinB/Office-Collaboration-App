import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class TakeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Card(
        color: AppColors.lightPrimaryColor,
          elevation: 0.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(color: Colors.white,width: 3)),
          child: Icon(Icons.camera_alt_outlined, size: 70,color: AppColors.darkPrimaryColor,)
      ),
    );
  }
}
