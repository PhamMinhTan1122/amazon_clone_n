import 'package:flutter/material.dart';

import '../../../Constants/global_variables.dart';
import '../../../common/widget/custom_button.dart';
import '../../../common/widget/custom_textfield.dart';
import '../services/auth_screen_ser.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController;
    _passController;
    _nameController;
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passController.text,
        name: _nameController.text);
  }

  Auth _auth = Auth.signup; // signup se dc chon lam mac dinh khi vao app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariales.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Builder(builder: (context) {
              //   return ElevatedButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, RegisterScreen.routeName);
              //       },
              //       child: Text('Sign Up'));
              // }),
              const Text(
                'WELCOME TO AMAZON',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariales.backgroundColor
                    : GlobalVariales.greyBackgroundCOlor,
                title: const Text(
                  'Create account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariales.secondaryColor,
                  value: Auth.signup,
                  groupValue:
                      _auth, //gia tri mac dinh https://api.flutter.dev/flutter/material/RadioListTile-class.html
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                      print(_auth);
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  color: GlobalVariales.backgroundColor,
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _nameController,
                            hintText: 'Enter Username'),
                        SizedBox(height: 10),
                        CustomTextField(
                            hintText: 'Email', controller: _emailController),
                        SizedBox(height: 10),
                        CustomTextField(
                            controller: _passController, hintText: 'Password'),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: 'Sign Up',
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                              print('Sign up success');
                            })
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariales.backgroundColor
                    : GlobalVariales.greyBackgroundCOlor,
                title: Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: GlobalVariales.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                        print(_auth);
                      });
                    }),
              ),
              if (_auth == Auth.signin)
                Container(
                  color: GlobalVariales.backgroundColor,
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        // CustomTextField(
                        // controller: _nameController, hintText: 'Username'),
                        // SizedBox(height: 10),
                        CustomTextField(
                            hintText: 'Email', controller: _emailController),
                        SizedBox(height: 10),
                        CustomTextField(
                            controller: _passController, hintText: 'Password'),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: 'Sign In',
                            onTap: () {
                              print('Sign In success');
                            })
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
