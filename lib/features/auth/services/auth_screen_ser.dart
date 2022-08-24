import 'package:amazon_clone/Constants/Error_handing.dart';
import 'package:amazon_clone/Constants/uilts.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/Constants/global_variables.dart';

class AuthService {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // User user = User('', name, email, password, '', '', '');
      User user = User('', name, email, password, '', '', '');
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Accept': 'application/json',
            // 'Access-Controlication/json','
          });
      // print(res.statusCode);
      ErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Navigator.pushNamed(context, HomePageReal.routeName);
            showSnackBar(
                context, 'Account created! Login with the same credentials');
          });
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }
}
