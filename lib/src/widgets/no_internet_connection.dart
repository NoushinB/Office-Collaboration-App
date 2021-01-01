import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final double imageSize;
  final bool showRetryButton;
  final VoidCallback retryCallback;

  const NoInternetConnection({
    Key key,
    @required this.assetImage,
    @required this.title,
    this.description,
    this.imageSize = 96.0,
    this.showRetryButton,
    this.retryCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(assetImage, width: imageSize, height: imageSize),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'IranSans'),
            ),
            Text(
              description ?? "",
              style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'IranSans'),
            ),
            SizedBox(height: 10),
            _makeRetryButton(context)
          ],
        ),
      ),
    );
  }

  _makeRetryButton(BuildContext context) {
    if (showRetryButton != null && showRetryButton) {
      return RaisedButton(
        padding: const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 8),
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(
          "Retry",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'IranSans'),
        ),
        onPressed: () {
          retryCallback();
        },
      );
    }
    return Container();
  }
}
