part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String number;

  AddNumber(this.number);
}

class AddOperator extends CalculatorEvent {
  final String operator;

  AddOperator(this.operator);
}

class ChangeSign extends CalculatorEvent {}

class CalculateResult extends CalculatorEvent {}

class DeleteLastNumber extends CalculatorEvent {}
