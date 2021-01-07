import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final double height;
  final VoidCallback onPressed;

  SecondaryButton({@required this.child, this.onPressed, this.height = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor,
                offset: Offset(0, 5),
                blurRadius: 6,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(child: child),
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
