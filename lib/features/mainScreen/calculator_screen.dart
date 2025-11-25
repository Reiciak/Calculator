import 'package:flutter/material.dart';
import 'package:kalkulator/features/widgets/calculator_display.dart';
import 'package:kalkulator/features/widgets/calculator_numbers_grid.dart';
import 'package:kalkulator/features/widgets/calculator_operations_grid.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Calculator', textDirection: TextDirection.ltr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: CalculatorDisplay(),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                   Expanded(
                    flex: 3,
                    child: CalculatorNumbersGrid(),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    flex: 2,
                    child: CalculatorOperationsGrid(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}