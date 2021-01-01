import 'package:flutter/material.dart';

class ConfirmBottomSheetDialog extends StatelessWidget {
  final String textTitle;
  final String okText;
  final String cancelText;
  final VoidCallback onCancelTap;
  final VoidCallback onOkTap;

  const ConfirmBottomSheetDialog({
    Key key,
    @required this.textTitle,
    @required this.okText,
    this.cancelText,
    this.onCancelTap,
    this.onOkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 150,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 8,),
          Expanded(
            child: Text(textTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.title.copyWith(fontSize: 14)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlineButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                borderSide: BorderSide(color: Colors.red),
                textColor: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(cancelText ?? "Cancel"),
                ),
                onPressed: () => onCancelTap(),
              ),
              OutlineButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                borderSide: BorderSide(color: Colors.green),
                textColor: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(okText),
                ),
                onPressed: () => onOkTap(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
