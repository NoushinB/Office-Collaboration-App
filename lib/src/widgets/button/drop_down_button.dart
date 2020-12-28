import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          new Column(
            children: <Widget>[
              new DropdownButton<String>(
                items: <String>['Villa', 'Appartment'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
