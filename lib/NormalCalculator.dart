import 'package:calculator1/consts.dart';
import 'package:calculator1/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class NormalCalculator extends StatefulWidget {
  const NormalCalculator({Key? key}) : super(key: key);

  @override
  State<NormalCalculator> createState() => _NormalCalculatorState();
}

class _NormalCalculatorState extends State<NormalCalculator> {
  String inputString="";
  String textTodisplay="";
  String res="";
  String btnclicked(String btnvalue){
    Parser p=Parser();
    Expression exp1 = p.parse(btnvalue);
    ContextModel cm = ContextModel();
    double eval1 = exp1.evaluate(EvaluationType.REAL, cm);
    return eval1.toString();
  }

  Widget custombutton(String btnvalue){
    return Expanded(
      child: OutlinedButton(
          // padding: EdgeInsets.all(25.0),
          onPressed: (){
            if(btnvalue=='C')
            inputString="";
            else if(btnvalue=='=')
           inputString=btnclicked(inputString);
            else if(btnvalue=="x")
              inputString=inputString.substring(0,inputString.length-1);
            else
            inputString=inputString+btnvalue;
            setState(() {
              res=inputString;
            });
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white70,
            padding: const EdgeInsets.all(20)),
        child:Text(btnvalue,
          style: const TextStyle(fontSize: 25.0,
            fontWeight: FontWeight.w600,),),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Container(
      // color: Colors.lightGreen,
      color: calculateColor(),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return const MyApp();
            })
            );
          }, child: const Text("Home")),

          Expanded(child: Container(
            // color: Colors.green,
            padding: EdgeInsets.fromLTRB(0, 0, 25, 10),
            alignment: Alignment.bottomRight,
            child: Text(
              res,
              style: TextStyle(fontSize: 25.0,
                  fontWeight: FontWeight.w600),
            ),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Row(
              children: [
                custombutton("C"),
                custombutton("x"),
                custombutton("^"),
                custombutton("+"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Row(
              children: [
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("+"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Row(
              children: [
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
          ),Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Row(
              children: [
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("*"),
              ],
            ),
          ),Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,100),
            child: Row(
              children: [
                custombutton("0"),
                custombutton("00"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
