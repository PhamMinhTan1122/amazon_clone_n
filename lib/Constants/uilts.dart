// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

class BaseDialog extends StatelessWidget {
  final String title;
  final String content;
  final String textAct1;
  final String textAct2;
  final Function OnPressed1;
  final Function OnPressed2;
  BaseDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.textAct1,
      required this.textAct2,
      required this.OnPressed1,
      required this.OnPressed2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, textAct1),
          child: Text(textAct1),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, textAct2),
          child: Text(textAct2),
        ),
      ],
    );
  }
}
