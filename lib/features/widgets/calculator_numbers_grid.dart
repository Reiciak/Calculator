import 'package:flutter/material.dart';
import 'package:kalkulator/features/widgets/calculator_button.dart';

class CalculatorNumbersGrid extends StatelessWidget {

  const CalculatorNumbersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double spacing = 8.0;
        final double itemWidth = (constraints.maxWidth - spacing * 2) / 3;
        final double itemHeight = (constraints.maxHeight - spacing * 3) / 4;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: List.generate(9, (index) {
                final number = (2 - (index ~/ 3)) * 3 + (index % 3) + 1;
                return SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: CalculatorButton(text: '$number'),
                );
              }),
            ),
            SizedBox(height: spacing),
            SizedBox(
              width: constraints.maxWidth,
              height: itemHeight,
              child: CalculatorButton(text: '0'),
            ),
          ],
        );
      },
    );
  }
}