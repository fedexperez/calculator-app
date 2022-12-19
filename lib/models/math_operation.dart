class MathOperation {
  late final String? mathResult;
  final String? firstNumber;
  final String? secondNumber;
  final String? operator;

  MathOperation({
    this.mathResult = '0',
    this.firstNumber = '',
    this.secondNumber = '',
    this.operator = '',
  });

  MathOperation copyWith({
    String? mathResult,
    String? firstNumber,
    String? secondNumber,
    String? operator,
  }) {
    return MathOperation(
      mathResult: mathResult ?? this.mathResult,
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      operator: operator ?? this.operator,
    );
  }
}
