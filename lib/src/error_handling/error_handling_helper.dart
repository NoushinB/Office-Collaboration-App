import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:mulki_zerin/src/models/login/exception_ui_model.dart';
import 'package:mulki_zerin/src/models/my_http_response_model.dart';
import 'exceptions/anAuthorized_access_exception.dart';
import 'exceptions/app_exception.dart';
import 'exceptions/internal_server_exception.dart';
import 'exceptions/no_internet_exception.dart';

class ErrorHandlingHelper {
  static bool ensureSuccessResponse(Response response, {String defaultMsg}) {
    if (response.statusCode == 200 || response.statusCode == 201) return true;

    if (response.statusCode == 501) {
      // This is custom error code comes from server
      var message = defaultMsg;
      try {
        var result = MyHttpResponseModel.fromJson(json.decode(response.body));
        message = result.message;
      } catch (e) {}
      throw new AppException(message: message);
    }

    if (response.statusCode == 500) {
      throw new InternalServerException();
    }

    if (response.statusCode == 302) {
      // Network is connected, but it is limited. For example when network need to recharge
      // The target resource resides temporarily under a different URI.
      throw new NoInternetException(statusCode: 302);
    }

    if (response.statusCode == 401) {
      throw new UnAuthorizedAccessException();
    }

    throw new AppException(message: defaultMsg);
  }

  static ExceptionUIModel getExceptionUIData(BuildContext context, Exception exception) {
    var result = new ExceptionUIModel(message: "Error occured! Please try again");
    result.exception = exception;
    if (exception is AppException) {
      result.message = exception.message;
    }

    if (exception is NoInternetException) {
      if (exception.statusCode == 302) {
        result.message =
        "Error communicating with server. Please check your internet connection";
      } else {
        result.message = "Error communicating with server";
      }
    }

    if (exception is SocketException) {
      if (exception.osError.errorCode == 101) {
        result.message = "Network is unreachable";
      } else {
        result.message = "Error communicating with server";
      }
    }

    if (exception is InternalServerException) {
      result.message = "Unknown error occurred in server";
    }

    return result;
  }
}


