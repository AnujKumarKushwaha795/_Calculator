import 'dart:math';
import 'package:flutter/material.dart';

class ScientificCalculator extends StatefulWidget {
  @override
  _ScientificCalculatorState createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  String display = '0';
  double currentValue = 0.0;
  String currentOperation = '';
  bool radiansMode = true;

  void handleNumberClick(int number) {
    setState(() {
      if (display == '0' || display == '-0') {
        display = number.toString();
      } else {
        display += number.toString();
      }
    });
  }

  void handleDecimalPoint() {
    if (!display.contains('.')) {
      setState(() {
        display += '.';
      });
    }
  }

  void handleOperation(String operation) {
    setState(() {
      currentValue = double.parse(display);
      currentOperation = operation;
      display = '0';
    });
  }

  void handleEquals() {
    setState(() {
      final double secondValue = double.parse(display);
      switch (currentOperation) {
        case '+':
          currentValue += secondValue;
          break;
        case '-':
          currentValue -= secondValue;
          break;
        case '×':
          currentValue *= secondValue;
          break;
        case '÷':
          if (secondValue != 0) {
            currentValue /= secondValue;
          } else {
            display = 'Error';
            return;
          }
          break;
      }
      display = currentValue.toString();
      currentOperation = '';
    });
  }

  void clear() {
    setState(() {
      display = '0';
      currentValue = 0.0;
      currentOperation = '';
    });
  }

  void handleSignChange() {
    setState(() {
      if (display != '0' && display != '-0') {
        if (display.startsWith('-')) {
          display = display.substring(1);
        } else {
          display = '-' + display;
        }
      }
    });
  }

  void handleSquareRoot() {
    setState(() {
      final double value = double.parse(display);
      if (value >= 0) {
        display = sqrt(value).toString();
      } else {
        display = 'Error';
      }
    });
  }

  void handleTrigFunction(String function) {
    setState(() {
      final double value = radiansMode ? double.parse(display) : radiansToDegrees(double.parse(display));
      switch (function) {
        case 'sin':
          display = sin(value).toString();
          break;
        case 'cos':
          display = cos(value).toString();
          break;
        case 'tan':
          if (cos(value) != 0) {
            display = (sin(value) / cos(value)).toString();
          } else {
            display = 'Error';
          }
          break;
      }
    });
  }

  double radiansToDegrees(double radians) {
    return radians * (180.0 / pi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scientific Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  display,
                  style: TextStyle(fontSize: 36.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CalculatorButton(
                  text: '7',
                  onPressed: () => handleNumberClick(7),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => handleNumberClick(8),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => handleNumberClick(9),
                ),
                CalculatorButton(
                  text: 'C',
                  onPressed: () => clear(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CalculatorButton(
                  text: '4',
                  onPressed: () => handleNumberClick(4),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => handleNumberClick(5),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => handleNumberClick(6),
                ),
                CalculatorButton(
                  text: '+',
                  onPressed: () => handleOperation('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CalculatorButton(
                  text: '1',
                  onPressed: () => handleNumberClick(1),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => handleNumberClick(2),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => handleNumberClick(3),
                ),
                CalculatorButton(
                  text: '-',
                  onPressed: () => handleOperation('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CalculatorButton(
                  text: '0',
                  onPressed: () => handleNumberClick(0),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => handleDecimalPoint(),
                ),
                CalculatorButton(
                  text: '±',
                  onPressed: () => handleSignChange(),
                ),
                CalculatorButton(
                  text: '×',
                  onPressed: () => handleOperation('×'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CalculatorButton(
                  text: '√',
                  onPressed: () => handleSquareRoot(),
                ),
                CalculatorButton(
                  text: 'sin',
                  onPressed: () => handleTrigFunction('sin'),
                ),
                CalculatorButton(
                  text: 'cos',
                  onPressed: () => handleTrigFunction('cos'),
                ),
                CalculatorButton(
                  text: 'tan',
                  onPressed: () => handleTrigFunction('tan'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CalculatorButton(
                  text: 'Rad/Deg',
                  onPressed: () => setState(() => radiansMode = !radiansMode),
                ),
                CalculatorButton(
                  text: '=',
                  onPressed: () => handleEquals(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CalculatorButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey, // Button color
            onPrimary: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}

