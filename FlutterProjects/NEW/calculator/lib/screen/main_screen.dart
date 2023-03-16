import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> history = [];
  String equation = "";
  String result = "0";
  String expression = "";
  double equationFontSize = 30.0;
  double resultFontSize = 60.0;

  Color backgroundColor = Colors.white;
  Color primaryTextColor = Color(0xffaaaaaa);
  Color secondaryTextColor = Color(0xff4e4e4e);
  Color btnColor = Color(0xffff6f6f);

  Color equationColor = Color(0xffaaaaaa);
  Color resultColor = Color(0xff4e4e4e);

  List<String> popupMenuItem = ['Change Theme', 'About'];

  @override
  void initState() {
    super.initState();
    getHistory().then(updateHistory);
  }

  void updateHistory(List<String> oldHistory) {
    if (oldHistory != null) {
      setState(() {
        this.history = oldHistory;
      });
    }
  }

  Widget button(String btnText, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: MaterialButton(
        padding: EdgeInsets.all(15),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 23),
        ),
        splashColor: Colors.transparent,
        textColor: color,
        onPressed: () => btnPressed(btnText),
        shape: CircleBorder(),
      ),
    );
  }

  Widget buttonClear(String btnText, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: MaterialButton(
        padding: EdgeInsets.all(15),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 23),
        ),
        splashColor: Colors.transparent,
        textColor: color,
        onPressed: () => btnPressed(btnText),
        onLongPress: clearHistory,
        shape: CircleBorder(),
      ),
    );
  }

  Widget buttonEquall(String btnText, Color color, Color backColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: RaisedButton(
        elevation: 10,
        padding: EdgeInsets.all(15),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 23),
        ),
        splashColor: Colors.transparent,
        textColor: color,
        onPressed: () => btnPressed(btnText),
        color: backColor,
        shape: CircleBorder(),
      ),
    );
  }

  clearHistory() async {
    setState(() {
      history = [];
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  btnPressed(String buttonText) {
    setState(
      () {
        if (buttonText == "C") {
          equation = "";
          result = "0";
          equationFontSize = 30.0;
          resultFontSize = 60.0;
          equationColor = Color(0xffaaaaaa);
          resultColor = Color(0xff4e4e4e);
        } else if (buttonText == "⌫") {
          if (equation.length < 2) {
            equation = '';
            result = '0';
            equationFontSize = 30.0;
            resultFontSize = 60.0;
            equationColor = Color(0xffaaaaaa);
            resultColor = Color(0xff4e4e4e);
          } else {
            equationFontSize = 60.0;
            resultFontSize = 30.0;
            equation = equation.substring(0, equation.length - 1);
            if (equation.endsWith('+') ||
                equation.endsWith('-') ||
                equation.endsWith('÷') ||
                equation.endsWith('%') ||
                equation.endsWith('×')) {
              return;
            } else {
              calculation();
            }
          }
        } else if (buttonText == "=") {
          equationFontSize = 30.0;
          resultFontSize = 60.0;
          equationColor = Color(0xffaaaaaa);
          resultColor = Color(0xff4e4e4e);

          setState(() {
            history.add('${equation + '=' + result}');
          });
          saveHistory(history, '${equation + '=' + result}');
        } else {
          if (buttonText == '+' ||
              buttonText == '-' ||
              buttonText == '÷' ||
              buttonText == '%' ||
              buttonText == '×') {
            if (equation == '') {
              return;
            }
            equation = equation + buttonText;
          } else {
            equationFontSize = 60.0;
            resultFontSize = 30.0;
            equationColor = Color(0xff4e4e4e);
            resultColor = Color(0xffaaaaaa);
            if (equation == "0") {
              equation = buttonText;
            } else {
              equation = equation + buttonText;

              calculation();
            }
          }
        }
      },
    );
  }

  void calculation() {
    String temp = '';
    expression = equation;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);

      ContextModel cm = ContextModel();
      temp = '${exp.evaluate(EvaluationType.REAL, cm)}';
      if (temp.endsWith('.0')) {
        result = "${temp.substring(0, temp.length - 2)}";
      } else {
        result = '$temp';
      }
    } catch (e) {
      result = "Error";
    }
  }

  // void menuChoice(String string) {
  //   print(string);
  //   if (string == popupMenuItem[0]) {
  //     showModalBottomSheet(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return Container(
  //             height: 200,
  //             width: 100,
  //             child: Text('adf'),
  //           );
  //         });
  //   } else {}
  // }
  Future<void> saveHistory(List<String> oldList, String newCalculation) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (oldList == null) {
      oldList = [];
    }
    prefs.setStringList('history', oldList + [newCalculation]);
  }

  Future<List<String>> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('history');
    return history;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //     icon: Icon(
        //       Icons.more_vert,
        //       color: secondaryTextColor,
        //     ),
        //     onSelected: menuChoice,
        //     itemBuilder: (BuildContext context) {
        //       return popupMenuItem.map((String choice) {
        //         return PopupMenuItem<String>(
        //           child: Text(choice),
        //         );
        //       }).toList();
        //     },
        //   )
        // ],
      ),
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.32,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: SafeArea(
                              child: Text(
                                history[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: primaryTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.vertical,
                      )),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          equation,
                          style: TextStyle(
                            fontSize: equationFontSize,
                            color: equationColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SafeArea(
                          child: Text(
                            result,
                            style: TextStyle(
                              fontSize: resultFontSize,
                              color: resultColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: primaryTextColor,
                  height: 0.1,
                  endIndent: 20.0,
                  indent: 20.0,
                ),
                Container(
                  height: constraints.maxHeight * 0.67,
                  width: constraints.maxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: buttonClear('C', secondaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('⌫', secondaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('%', secondaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('÷', btnColor),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: button('7', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('8', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('9', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('×', btnColor),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: button('4', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('5', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('6', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('-', btnColor),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: button('1', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('2', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('3', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('+', btnColor),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: button('00', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('0', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: button('.', primaryTextColor),
                          ),
                          Expanded(
                            flex: 1,
                            child: buttonEquall('=', backgroundColor, btnColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
