import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  PrimaryButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    const double radius = 23.0;
    return Container(
      height: 48,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.darkPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x65ff6969),
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightPrimaryColor,
                          fontSize: 16),
                    )),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.darkPrimaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
