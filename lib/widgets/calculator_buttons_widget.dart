import 'package:bloc_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:bloc_calculator/widgets/widgets.dart';

class ButtonsGrid extends StatelessWidget {
  ButtonsGrid({
    super.key,
    this.crossAxisElements = 4,
  });

  final int crossAxisElements;
  final List<int> items = List.generate(9, (index) => index);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(children: [
      SizedBox(
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                  width: size.width,
                  child: StaggeredGrid.count(
                    axisDirection: AxisDirection.up,
                    crossAxisCount: crossAxisElements,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    children: [
                      _customGridTile(
                          crossAxisCells: 2,
                          mainAxisCells: 1,
                          iconText: '0',
                          calculatorEvent: AddNumber('0')),
                      _customGridTile(
                          iconText: '.', calculatorEvent: AddNumber('.')),
                      _customGridTile(
                        iconText: '=',
                        calculatorEvent: CalculateResult(),
                        color: Colors.black,
                      ),
                      _customGridTile(
                          iconText: '1', calculatorEvent: AddNumber('1')),
                      _customGridTile(
                          iconText: '2', calculatorEvent: AddNumber('2')),
                      _customGridTile(
                          iconText: '3', calculatorEvent: AddNumber('3')),
                      _customGridTile(
                        iconText: '+',
                        calculatorEvent: AddOperator('+'),
                        color: Colors.black,
                      ),
                      _customGridTile(
                          iconText: '4', calculatorEvent: AddNumber('4')),
                      _customGridTile(
                          iconText: '5', calculatorEvent: AddNumber('5')),
                      _customGridTile(
                          iconText: '6', calculatorEvent: AddNumber('6')),
                      _customGridTile(
                        iconText: '-',
                        calculatorEvent: AddOperator('-'),
                        color: Colors.black,
                      ),
                      _customGridTile(
                          iconText: '7', calculatorEvent: AddNumber('7')),
                      _customGridTile(
                          iconText: '8', calculatorEvent: AddNumber('8')),
                      _customGridTile(
                          iconText: '9', calculatorEvent: AddNumber('9')),
                      _customGridTile(
                        iconText: 'x',
                        calculatorEvent: AddOperator('x'),
                        color: Colors.black,
                      ),
                      _customGridTile(
                        iconText: 'AC',
                        calculatorEvent: ResetAC(),
                        color: Colors.grey,
                      ),
                      _customGridTile(
                        iconText: '+/-',
                        calculatorEvent: ChangeSign(),
                        color: Colors.grey,
                      ),
                      _customGridTile(
                        iconText: 'del',
                        calculatorEvent: DeleteLastNumber(),
                        color: Colors.grey,
                      ),
                      _customGridTile(
                        iconText: '/',
                        calculatorEvent: AddOperator('/'),
                        color: Colors.black,
                      ),
                    ],
                  )),
            ],
          )),
    ]);
  }

  StaggeredGridTile _customGridTile({
    int crossAxisCells = 1,
    int mainAxisCells = 1,
    required String iconText,
    required CalculatorEvent calculatorEvent,
    Color color = Colors.lightBlue,
  }) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCells,
      mainAxisCellCount: mainAxisCells,
      child: ButtonTile(
        action: iconText,
        calculatorEvent: calculatorEvent,
        buttonColor: color,
      ),
    );
  }

  // List<Widget> generateNumbers() {
  //   return List.generate(
  //       items.length,
  //       (index) => StaggeredGridTile.count(
  //             crossAxisCellCount: 1,
  //             mainAxisCellCount: 1,
  //             child: ButtonTile(action: '${index + 1}'),
  //           ));
  // }
}
