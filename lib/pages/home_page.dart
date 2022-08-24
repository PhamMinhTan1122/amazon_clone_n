import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageReal extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomePageReal({Key? key}) : super(key: key);

  @override
  State<HomePageReal> createState() => _HomePageRealState();
}

class _HomePageRealState extends State<HomePageReal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Hello')));
  }
}
