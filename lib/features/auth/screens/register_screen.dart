import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register-screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('this is register screen'),
          Builder(builder: (context) {
            return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AuthScreen.routeName);
                },
                child: Text('Back to Home'));
          })
        ],
      )),
    );
  }
}
