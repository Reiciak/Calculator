import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../calculator_controller.dart';
import 'dart:math';

class CalculatorButton extends ConsumerWidget {
  final String text;

  const CalculatorButton({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const maxFontSize = 32.0;
        final dynamicFontSize = constraints.maxHeight * 0.3;
        final responsiveFontSize = min(dynamicFontSize, maxFontSize);

        return ElevatedButton(
            onPressed: () {
              ref.read(displayNotifierProvider.notifier).updateDisplay(text);
            },
            onLongPress: null,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              textStyle: TextStyle(fontSize: responsiveFontSize),
            ),
            child: Text(text),
        );
      },
    );
  }
}