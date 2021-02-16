import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class SearchButton extends StatelessWidget {
  final Color color;

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  SearchButton({@required this.color, this.onPressed,this.title,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 140,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                color: color,
                offset: Offset(0, 5),
                blurRadius: 6,
              ),
            ],
          ),
          child: Center(child: Icon(icon,size: 60,color: AppColors.darkPrimaryColor,),),
        ),
      ),
    );
  }
}