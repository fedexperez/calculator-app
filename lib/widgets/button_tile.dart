import 'package:bloc_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonTile extends StatelessWidget {
  const ButtonTile(
      {super.key,
      required this.action,
      required this.buttonColor,
      required this.calculatorEvent});

  final String action;
  final Color buttonColor;
  final CalculatorEvent calculatorEvent;

  @override
  Widget build(BuildContext context) {
    final calculatorBloc =
        BlocProvider.of<CalculatorBloc>(context, listen: false);

    return GestureDetector(
      onTap: () => calculatorBloc.add(calculatorEvent),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              action,
              style: TextStyle(color: buttonColor),
            ),
          ),
        ),
      ),
    );
  }
}
