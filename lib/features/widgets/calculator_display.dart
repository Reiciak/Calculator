import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../calculator_controller.dart';
import 'dart:math';

class CalculatorDisplay extends ConsumerWidget {
  const CalculatorDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayText = ref.watch(displayNotifierProvider);
    return LayoutBuilder(
        builder: (context, constraints){
          const maxFontSize = 48.0;
          final dynamicFontSize = constraints.maxHeight * 0.3;
          final responsiveFontSize = min(dynamicFontSize, maxFontSize);
          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5, red: 0, green: 0, blue: 0),
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric( horizontal: 12),
            child: Text(
              displayText.isEmpty ? "0" : displayText,
              style: TextStyle(
                  fontSize: responsiveFontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          );
        },
    );
  }
}
