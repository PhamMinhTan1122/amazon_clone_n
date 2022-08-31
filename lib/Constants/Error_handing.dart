import 'dart:convert';

import 'package:amazon_clone/Constants/uilts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void ErrorHandle(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, response.body.replaceAll("\"", ""));
      break;
    case 500:
      showSnackBar(context, response.body.replaceAll("\"", ""));
      break;
    default:
      showSnackBar(context, response.body.replaceAll("\"", ""));
  }
}
