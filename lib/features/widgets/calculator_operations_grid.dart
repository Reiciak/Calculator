import 'package:flutter/material.dart';
import 'package:kalkulator/features/widgets/calculator_button.dart';

class CalculatorOperationsGrid extends StatelessWidget {
  const CalculatorOperationsGrid({super.key});

  @override Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 8.0;
        final double itemWidth = (constraints.maxWidth - spacing * 2) / 3;
        final double itemHeight = (constraints.maxHeight - spacing * 3) / 4;

        final List<String> ops = ['<-', 'AC', '.', '+', '-', '%', '*', '/', '+/-'];

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: ops.map((op) {
                return SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: CalculatorButton(text: op),
                );
              }).toList(),
            ),
            SizedBox(height: spacing),
            SizedBox(
              width: constraints.maxWidth,
              height: itemHeight,
              child: CalculatorButton(text: '='),
            ),
          ],
        );
      },
    );
  }
}