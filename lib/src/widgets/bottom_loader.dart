import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  final double strokeWidth;

  const BottomLoader({Key key, @required this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: this.strokeWidth,
          ),
        ),
      ),
    );
  }
}
