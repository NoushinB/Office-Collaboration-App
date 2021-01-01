import 'package:flutter/material.dart';
import 'package:mulki_zerin/src/error_handling/error_handling_helper.dart';

class ExceptionView extends StatelessWidget {
  final Exception exception;

  const ExceptionView(this.exception);

  @override
  Widget build(BuildContext context) {
    var exceptionData = ErrorHandlingHelper.getExceptionUIData(context, exception);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Center(
        child: Text(
          exceptionData.message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
