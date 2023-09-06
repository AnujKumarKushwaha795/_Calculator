import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:units_converter/units_converter.dart';
class BinaryCalculator1 extends StatefulWidget {
  const BinaryCalculator1({super.key});

  @override
  _BinaryCalculatorState createState() => _BinaryCalculatorState();
}

class _BinaryCalculatorState extends State<BinaryCalculator1> {
// Convert into binary number.
  bool BinaryOnOff=true;
  int num=0;
  String Binput="";
  String BinputB="";
  String BinputO="";
  String BinputH="";


  String decimal="";
  String binary="1110";
  String? octal="";
  String? hexadecimal="";

  String result="";
  var it;
  var it2;
  String Fun3(items){
    it=items;
    return items.toString();
  }
  String MyFun2(items){
    it2=items;
    return items.toString();
  }

  void MyFun(String input1){
    if(it=="Decimal To"&&it2=="Decimal") {
      setState(() {
        print("Decimal to Decimal");
        Binput = input1;
      });
    }
    else  if(it=="Decimal To"&&it2=="Binary"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.decimal, input1);
      print("Decimal to Binary");
      setState(() {
        binary=numeralSystems.binary.stringValue!;
        BinputB=binary!;
      });
    }
    else if(it=="Decimal To"&&it2=="Octal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.decimal, input1);
      setState(() {
        octal=numeralSystems.octal.stringValue;
        BinputO=octal!;
      });
    }
    else  if(it=="Decimal To"&&it2=="Hexadecimal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.decimal, input1);
      setState(() {
        hexadecimal=numeralSystems.hexadecimal.stringValue;
        BinputH=hexadecimal!;
      });
    }
    if(it=="Binary To"&&it2=="Binary") {
      setState(() {
        BinputB = input1;
      });
    }
    else  if(it=="Binary To"&&it2=="Decimal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.binary, input1);
      setState(() {
        Binput=numeralSystems.decimal.stringValue!;
      });
    }
    else if(it=="Binary To"&&it2=="Octal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.binary, input1);
      setState(() {
        BinputO=numeralSystems.octal.stringValue!;
      });
    }
    else  if(it=="Binary To"&&it2=="Hexadecimal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.binary, input1);
      setState(() {
        BinputH=numeralSystems.hexadecimal.stringValue!;
      });
    }


    if(it=="Octal To"&&it2=="Octal") {
      setState(() {
        BinputO = input1;
      });
    }
    else  if(it=="Octal To"&&it2=="Decimal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.octal, input1);
      setState(() {
        Binput=numeralSystems.decimal.stringValue!;
      });
    }
    else if(it=="Octal To"&&it2=="Binary"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.octal, input1);
      setState(() {
        BinputB=numeralSystems.binary.stringValue!;
      });
    }
    else  if(it=="Octal To"&&it2=="Hexadecimal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.octal, input1);
      setState(() {
        BinputH=numeralSystems.hexadecimal.stringValue!;
      });
    }

    if(it=="Hexadecimal To"&&it2=="Hexadecimal") {
      setState(() {
        BinputH= input1;
      });
    }
    else  if(it=="Hexadecimal To"&&it2=="Decimal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.hexadecimal, input1);
      setState(() {
        Binput=numeralSystems.decimal.stringValue!;
      });
    }
    else if(it=="Hexadecimal To"&&it2=="Binary"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.hexadecimal, input1);
      setState(() {
        BinputB=numeralSystems.binary.stringValue!;
      });
    }
    else  if(it=="Hexadecimal To"&&it2=="Octal"){
      var numeralSystems = NumeralSystems()..convert(NUMERAL_SYSTEMS.hexadecimal, input1);
      setState(() {
        BinputO=numeralSystems.octal.stringValue!;
      });
    }


  }








  String output = '0';
  String _output = '0';
  String operand = '';
  String binary1 = '';
  String binary2 = '';




  buttonPressed(String buttonText) {
    if (BinaryOnOff == true) {
      if (buttonText == 'C') {
        _output = '0';
        binary1 = '';
        binary2 = '';
        operand = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' ||
          buttonText == '/') {
        binary1 = output;
        operand = buttonText;
        _output = '0';
      }
      else if (buttonText == "x") {
        _output = _output.substring(0, _output.length - 1);
      } else if (buttonText == "Res") {
        binary2 = output;
        int num1 = int.parse(binary1, radix: 2);
        int num2 = int.parse(binary2, radix: 2);

        if (operand == '+') {
          _output = (num1 + num2).toRadixString(2);
        } else if (operand == '-') {
          _output = (num1 - num2).toRadixString(2);
        } else if (operand == '*') {
          _output = (num1 * num2).toRadixString(2);
        } else if (operand == '/') {
          _output = (num1 ~/ num2).toRadixString(2);
        }
        binary1 = '';
        binary2 = '';
        operand = '';
      } else {
        _output = _output + buttonText;
      }

      setState(() {
        output = _output;
      });
    }
    else{

       if(it=="Decimal To"){
       if(buttonText=='0'||buttonText=='1'||buttonText=='2'||buttonText=='3'||buttonText=='4'||buttonText=='5'||
           buttonText=='6'||buttonText=='7'||buttonText=='8'||buttonText=='9'){
         setState(() {
           Binput=Binput+buttonText;
         });
        }
       else if(buttonText=='C'){
         setState(() {
           Binput="";
         });
        }
       else if (buttonText == "x") {
         setState(() {
           Binput = Binput.substring(0, Binput.length - 1);
         });
        }
        if(buttonText=="Res"){
         MyFun(Binput);
        }
    }
     else if(it=="Binary To"){
         if(buttonText=='0'||buttonText=='1'||buttonText=='2'||buttonText=='3'||buttonText=='4'||buttonText=='5'||
             buttonText=='6'||buttonText=='7'||buttonText=='8'||buttonText=='9'){
           setState(() {
             BinputB=BinputB+buttonText;
           });
         }
         else if(buttonText=='C'){
           setState(() {
             BinputB="";
           });
         }
         else if (buttonText == "x") {
           setState(() {
             BinputB = BinputB.substring(0, BinputB.length - 1);
           });
         }
         if(buttonText=="Res"){
           MyFun(BinputB);
         }
       }

       else if(it=="Octal To"){
         if(buttonText=='0'||buttonText=='1'||buttonText=='2'||buttonText=='3'||buttonText=='4'||buttonText=='5'||
             buttonText=='6'||buttonText=='7'||buttonText=='8'||buttonText=='9'){
           setState(() {
             BinputO=BinputO+buttonText;
           });
         }
         else if(buttonText=='C'){
           setState(() {
             BinputO="";
           });
         }
         else if (buttonText == "x") {
           setState(() {
             BinputO = BinputO.substring(0, BinputO.length - 1);
           });
         }
         if(buttonText=="Res"){
           MyFun(BinputO);
         }
       }

       else if(it=="Hexadecimal To"){
         if(buttonText=='0'||buttonText=='1'||buttonText=='2'||buttonText=='3'||buttonText=='4'||buttonText=='5'||
             buttonText=='6'||buttonText=='7'||buttonText=='8'||buttonText=='9'){
           setState(() {
             BinputH=BinputH+buttonText;
           });
         }
         else if(buttonText=='C'){
           setState(() {
             BinputH="";
           });
         }
         else if (buttonText == "x") {
           setState(() {
             BinputH = BinputH.substring(0, BinputH.length - 1);
           });
         }
         if(buttonText=="Res"){
           MyFun(BinputH);
         }
       }
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        // padding: EdgeInsets.all(24.0),
        onPressed: () => buttonPressed(buttonText),
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white70,
            padding: const EdgeInsets.all(15)),
        // padding: EdgeInsets.all(24.0),
        child:Text(
          buttonText,
          style: const TextStyle(fontSize: 25.0,
            fontWeight: FontWeight.w600,),),
      ),
    );
  }
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Decimal To',
      'label': 'Decimal To',
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'Binary To',
      'label': 'Binary To',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'Octal To',
      'label': 'Octal To',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'Hexadecimal To',
      'label': 'Hexadecimal',
      // 'enable': false,
      'icon': Icon(Icons.grade),
    },
  ];
  final List<Map<String, dynamic>> _items2 = [
    {
      'value': 'Decimal',
      'label': 'Decimal',
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'Binary',
      'label': 'Binary',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'Octal',
      'label': 'Octal',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),
    },

    {
      'value': 'Hexadecimal',
      'label': 'Hexadecimal',
      // 'enable': false,
      'icon': const Icon(Icons.grade),
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10,10,10,15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
      Container(
      alignment: Alignment.center,
//       padding: const EdgeInsets.symmetric(
//       vertical: 24.0,
//       horizontal: 12.0,
// ),
        child: Column(
          children:  [
            Column(
              children: [
                Text("Decimal Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 15,),
                Container(
                  height: 30, width: 250, color: Colors.redAccent,
                  child: Center(
                    child: Text(Binput,style: TextStyle(fontSize: 18,color: Colors.black,),
                      textAlign: TextAlign.right,),
                  ),

                ),

                SizedBox(height: 10,),
                Text("Binary Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 10,),
                Container(height: 30, width: 250, color: Colors.lightGreen,
                  child: Center(
                    child: Text(BinputB!,style: TextStyle(fontSize: 18,color: Colors.black,),
                      textAlign: TextAlign.right,),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Octal Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 10,),
                Container(height: 30, width: 250, color: Colors.teal,
                  child: Center(
                    child: Text(BinputO!,style: TextStyle(fontSize: 18,color: Colors.white,),
                      textAlign: TextAlign.right,),
                  ),
                ),

                SizedBox(height: 10,),
                Text("Hexadecimal ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 10,),
                Container(
                  height: 30, width: 250,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(BinputH!,style: TextStyle(fontSize: 18,color: Colors.black,),
                      textAlign: TextAlign.right, ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),

     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
      Expanded(
        child: Container(
         height: 70 ,width: 180,
         child: Card(
           child:  Padding(
             padding: const EdgeInsets.fromLTRB(20,0,20,0),
             child: SelectFormField(
               cursorWidth: 20,
               // cursorRadius: Radius.elliptical(25, 3),
               type: SelectFormFieldType.dropdown, // or can be dialog
               initialValue: 'circle',
               // icon: Icon(Icons.fork_right_rounded),
               labelText: 'Convert',
               items: _items,
               onChanged: (items) => Fun3(items),
               onSaved: (items) => Fun3(items),
             ),
           ),
         ),
     ),
      ),

     Flexible(
       child: Container(
         height: 70,width: 165,
         child: Card(
           child:  Padding(
             padding: const EdgeInsets.fromLTRB(20,0,20,0),
             child: SelectFormField(
               type: SelectFormFieldType.dropdown, // or can be dialog
               initialValue: 'circle',
               // icon: Icon(Icons.filter_list_rounded),
               labelText: 'Convert',
               items: _items2,
               onChanged: (items) =>MyFun2(items),
               onSaved: (items) =>MyFun2(items),
             ),
           ),
         ),
       ),
     ),



   ],),


 Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: const EdgeInsets.fromLTRB(20,0,10,0),
      child: ElevatedButton(onPressed: (){
        buttonPressed("Res");
  }, child: const Text("Result")),
    ),
     const SizedBox(width: 20,),
    const Text("Binary Calculator",style: TextStyle(fontSize: 16,color: Colors.purple,fontWeight: FontWeight.bold),),
    Flexible(
      child: Card(
        child: Checkbox(
          value: BinaryOnOff,
          onChanged: (value) {
            setState(() {
               BinaryOnOff=value! ;
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.red,
        ),
      ),
    )
  ],
), ],
        ),
        ),

        Expanded(
            child: Container(
          // color: Colors.green,
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          alignment: Alignment.bottomRight,
          child: Text(
            output,
            style:  TextStyle(fontSize: 25.0,
                fontWeight: FontWeight.w600),),
        )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Row(
            children: [
              buildButton("C"),
              buildButton("x"),
              buildButton("/"),
              buildButton("*"),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Row(
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("-"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Row(
            children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("+"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Row(
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("0"),
            ],
          ),
        ),
      ]
      ),
    ),
    );

  }

}