import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';


class DisplayNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void updateDisplay(String newText) {
    switch(newText){
      case '<-':
        undoDisplay();
        break;
      case 'AC':
        clear();
        break;
      case '+/-':
        negate();
        break;
      case '=':
        calculations();
        break;
      default:
      addToDisplay(newText);
    }
  }

  void undoDisplay(){
    if (state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }

  void calculations() {
    final ExpressionParser parser = GrammarParser();
    final Expression exp = parser.parse(state);
    var context = ContextModel();
    var evaluator = RealEvaluator(context);
    final result = evaluator.evaluate(exp);
    if (result % 1 == 0) {
      if (result == 0.0) {
        clear();
        return;
      }
      state = result.toInt().toString();
    } else {
      state = result.toString();
    }
  }

  void clear() {
    state = "";
  }

  void addToDisplay(newText) {
    final operators = ['+', '-', '*', '/', '%', '.'];
    if (state.isNotEmpty && operators.contains(state.substring(state.length - 1))) {
      if (operators.contains(newText)) {
        return;
      }
    }
      state += newText;
  }

  void negate() {
    if (state.isEmpty) {
      return;
    }if (state == '0') {
      return;
    }
    if (state.startsWith('-')) {
      state = state.substring(1);
    } else {
      state = '-$state';
    }
  }

}


final displayNotifierProvider = NotifierProvider<DisplayNotifier, String>(DisplayNotifier.new);