import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class TakeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 224,
      child: Card(
          elevation: 2.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: AppColors.lightPrimaryColor,width: 3)),
          child: Icon(Icons.camera_alt_outlined, size: 70)
      ),
    );
  }
}
