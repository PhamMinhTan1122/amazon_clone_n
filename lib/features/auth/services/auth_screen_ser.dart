import 'dart:convert';

import 'package:amazon_clone/Constants/Error_handing.dart';
import 'package:amazon_clone/Constants/uilts.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth_screen.dart';

// ignore: slash_for_doc_comments
/**
 * get data users
 */
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

//sign in
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
          onSuccess: () async {
            // showSnackBar(context, 'Oh khong ngo ban co the nho tai khoan!!');
            // Navigator.pushNamed(context, HomePageReal.routeName);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http
          .post(Uri.parse('$uri/tokenIsValid'), headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
