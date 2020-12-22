import 'package:flutter/cupertino.dart';

class ExceptionUIModel {
  String title;
  String message;
  Icon icon;
  Exception exception;

  ExceptionUIModel({@required this.message, this.title, this.icon, this.exception});
}
