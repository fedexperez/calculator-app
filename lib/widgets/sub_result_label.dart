import 'package:flutter/material.dart';

class SubResultLabel extends StatelessWidget {
  const SubResultLabel({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(
          (text.endsWith('.0') ? text.substring(0, text.length - 2) : text),
          style: const TextStyle(fontSize: 30)),
    );
  }
}
