import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  equation,
                  style: TextStyle(
                    fontSize: 55.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 55.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                // ignore: deprecated_member_use
                customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                // ignore: deprecated_member_use
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                // ignore: deprecated_member_use

                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                // ignore: deprecated_member_use
                customOutlineButton("C"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => buttonClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  String equation = "";
  String result = "";
  String expression = "";
  void buttonClicked(String btext) {
    setState(() {
      if (btext == "C") {
        equation = "";
        result = "";
      } else if (btext == "=") {
        expression = equation;
        expression = expression.replaceAll("X", "*");

        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = btext;
        } else {
          equation = equation + btext;
        }
      }
    });
  }

  // int first = 0;
  // int second = 0;
// equation test
// result answer
  // String res = "", text = "", opp = "", answer = "";

  // void btnClicked(String btnText) {
  //   if (btnText == "C") {
  //     first = 0;
  //     second = 0;
  //     res = "";
  //     text = "";
  //     answer = "";
  //   } else if (btnText == "+" ||
  //       btnText == "-" ||
  //       btnText == "X" ||
  //       btnText == "/") {
  //     first = int.parse(text);
  //     res = "";
  //     opp = btnText;
  //   } else if (btnText == "=") {
  //     second = int.parse(text);
  //     if (opp == "+") {
  //       res = (first + second).toString();
  //     }
  //     if (opp == "-") {
  //       res = (first - second).toString();
  //     }
  //     if (opp == "X") {
  //       res = (first * second).toString();
  //     }
  //     if (opp == "/") {
  //       res = (first / second).toString();
  //     }
  //   } else {
  //     res = int.parse(text + btnText).toString();
  //   }

  //   setState(() {
  //     text = res;
  //   });
  // }
}
