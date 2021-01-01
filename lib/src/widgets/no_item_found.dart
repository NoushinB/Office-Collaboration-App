import 'package:flutter/material.dart';

class NoItemFound extends StatelessWidget {
  final assetImage;
  final imageSize;
  final title;
  final desc;
  final bool showActionButton;
  final actionButtonTitle;
  final Function actionCallback;

  const NoItemFound({Key key, @required this.assetImage, @required this.title, this.desc, this.showActionButton, this.actionButtonTitle, this.actionCallback, this.imageSize = 96.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.search, size: 96, color: Colors.grey),
            SizedBox(height: 5),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
            Text(desc ?? "", style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 10),
            _makeActionButton(),
          ],
        ),
      ),
    );
  }

  _makeActionButton() {
    if (showActionButton != null && showActionButton) {
      return RaisedButton(
        padding: const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 8),
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(
          actionButtonTitle ?? "",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          await actionCallback();
        },
      );
    }
    return Container();
  }
}
