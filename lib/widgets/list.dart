import 'package:flutter/material.dart';

class TextIntoList extends StatelessWidget {
  final String text;

  TextIntoList(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.body2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
