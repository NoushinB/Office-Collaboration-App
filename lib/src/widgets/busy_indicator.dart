import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BusyIndicator extends StatelessWidget {
  final Color color;
  final double size;
  final bool isInCenter;

  BusyIndicator({this.color = Colors.black, this.size = 24.0, this.isInCenter = true});

  @override
  Widget build(BuildContext context) {
    if (isInCenter) {
      return Center(
        child: SpinKitChasingDots(size: size, color: color),
      );
    } else {
      return SpinKitChasingDots(size: size, color: color);
    }
  }
}
