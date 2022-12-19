import 'package:flutter/material.dart';

import 'package:bloc_calculator/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const ResultsLabels()),
            ButtonsGrid(),
          ],
        ),
      ),
    );
  }
}
