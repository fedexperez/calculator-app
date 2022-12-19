part of 'calculator_bloc.dart';

abstract class CalculatorState {
  final MathOperation mathOperation;

  const CalculatorState({required this.mathOperation});
}

class CalculatorInitialState extends CalculatorState {
  const CalculatorInitialState({
    required super.mathOperation,
  });
}

class CalculatorSetState extends CalculatorState {
  final MathOperation newMathOperation;

  // const UserSetState({super.existUser = true, required this.newUser});
  const CalculatorSetState({required this.newMathOperation})
      : super(mathOperation: newMathOperation);
}
