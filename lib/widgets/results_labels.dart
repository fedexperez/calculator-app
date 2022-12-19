import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_calculator/widgets/widgets.dart';

class ResultsLabels extends StatelessWidget {
  const ResultsLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SubResultLabel(text: state.mathOperation.firstNumber!),
            SubResultLabel(text: state.mathOperation.operator!),
            SubResultLabel(text: state.mathOperation.secondNumber!),
            const LineSeparator(),
            MainResultLabel(
              text: (state.mathOperation.mathResult!),
            )
          ],
        );
      },
    );
  }
}
