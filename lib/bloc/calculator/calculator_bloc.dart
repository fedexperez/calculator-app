import 'package:bloc/bloc.dart';
import 'package:function_tree/function_tree.dart';

import 'package:bloc_calculator/models/math_operation.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc()
      : super(CalculatorInitialState(mathOperation: MathOperation())) {
    on<ResetAC>((event, emit) {
      emit(CalculatorInitialState(mathOperation: MathOperation()));
    });

    on<AddOperator>(
      (event, emit) {
        emit(CalculatorSetState(
          newMathOperation: (state.mathOperation.firstNumber == '')
              ? state.mathOperation.copyWith(
                  firstNumber: state.mathOperation.mathResult,
                  secondNumber: '',
                  operator: event.operator,
                  mathResult: '0',
                )
              : state.mathOperation.copyWith(
                  firstNumber: state.mathOperation.mathResult,
                  operator: event.operator,
                  secondNumber: '',
                  mathResult: '0',
                ),
        ));
      },
    );

    on<AddNumber>(
      (event, emit) {
        emit(CalculatorSetState(
          newMathOperation: (state.mathOperation.mathResult == '' ||
                  state.mathOperation.mathResult == '0')
              ? state.mathOperation.copyWith(mathResult: event.number)
              : state.mathOperation.copyWith(
                  secondNumber: '',
                  mathResult: state.mathOperation.mathResult! + event.number),
        ));
      },
    );

    on<ChangeSign>(
      (event, emit) {
        emit(CalculatorSetState(
          newMathOperation: (state.mathOperation.mathResult!.startsWith('-') ||
                  state.mathOperation.mathResult == '0')
              ? state.mathOperation.copyWith(
                  mathResult:
                      state.mathOperation.mathResult!.replaceFirst('-', ''))
              : state.mathOperation
                  .copyWith(mathResult: '-${state.mathOperation.mathResult!}'),
        ));
      },
    );

    on<DeleteLastNumber>((event, emit) {
      emit(CalculatorSetState(
        newMathOperation: (state.mathOperation.mathResult!.length > 1)
            ? state.mathOperation.copyWith(
                mathResult: state.mathOperation.mathResult!
                    .substring(0, state.mathOperation.mathResult!.length - 1))
            : state.mathOperation.copyWith(mathResult: '0'),
      ));
    });

    on<CalculateResult>((event, emit) {
      final String num1 = state.mathOperation.firstNumber!;
      final String num2 = state.mathOperation.mathResult!;
      final String opr = state.mathOperation.operator!.replaceAll('x', '*');

      final String mathExpression = '$num1$opr$num2';
      // print(mathExpression);

      if (mathExpression.contains('--')) {
        emit(CalculatorSetState(
            newMathOperation: state.mathOperation.copyWith(
                secondNumber: state.mathOperation.mathResult,
                mathResult: '${double.parse(num1) - double.parse(num2)}')));
      } else {
        emit(CalculatorSetState(
          newMathOperation: (state.mathOperation.firstNumber! != '')
              ? state.mathOperation.copyWith(
                  secondNumber: state.mathOperation.mathResult,
                  mathResult: '${mathExpression.interpret()}')
              : state.mathOperation.copyWith(mathResult: '0'),
        ));
      }
    });
  }
}
