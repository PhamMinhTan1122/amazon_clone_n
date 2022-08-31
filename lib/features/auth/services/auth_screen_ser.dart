import 'dart:convert';

import 'package:amazon_clone/Constants/Error_handing.dart';
import 'package:amazon_clone/Constants/uilts.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/Constants/global_variables.dart';

import '../screens/auth_screen.dart';

class AuthService {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User('', name, email, password, '', '', '');
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Accept': 'application/json',
          });
      // print(res.statusCode);
      ErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created! Login with the same credentials');
            showDialog(
                context: context,
                builder: (BuildContext context) => BaseDialog(
                    title: 'Da tao thanh tk thanh cong',
                    content: 'Bam OK de hoan thanh',
                    textAct1: 'Canel',
                    textAct2: 'OK',
                    OnPressed1: () => Navigator.pop(context, 'Cancel'),
                    OnPressed2: () => Navigator.pop(context, 'OK')));
          });
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Accept': 'application/json',
          });
      // print(res.statusCode);
      ErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Oh khong ngo ban co the nho tai khoan!!');
            Navigator.pushNamed(context, HomePageReal.routeName);
          });
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }
}
