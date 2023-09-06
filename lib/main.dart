import 'package:calculator1/ScientificCalculator.dart';
import 'package:calculator1/NormalCalculator.dart';
import 'package:calculator1/ScientificCalculator.dart';
import 'package:calculator1/scientific.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

   appBar: AppBar(
   title: const Text("Calculator"),
   ),
      body: Container(
        padding:  EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              height: 50,
              color: Colors.pink,
              child:  ListTile(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return const NormalCalculator();
                  })
                  );
                },
                title: const Text("Normal Calculator",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30,),),
              ),
            ),
            const SizedBox(height: 10,),
            // Flexible(
            //   child: Container(
            //     height: 50,
            //     color: Colors.green,
            //     child:  ListTile(
            //       onTap: (){
            //         Navigator.push(context, MaterialPageRoute(builder: (context){
            //           return  BinaryCalculator();
            //         }));
            //       },
            //       title: const Text("Scientific Calculator",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30,),),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10,),
            Container(height: 50,
              color: Colors.red,
              child:  ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return BinaryCalculator1();
                  }
                  ));
                },
                title: const Text("Binary Calculator",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30,),),
              ),
            ),
            const SizedBox(height: 10,),
            Flexible(
              child: Container(height: 50,
                color: Colors.deepPurpleAccent,
                child:  ListTile(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return ScientificCalculator();
                    })
                    );
                  },
                  title: const Text(" Scientific Calculator",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30,),),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            // Flexible(
            //   child: Container(height: 50,
            //     color: Colors.yellowAccent,
            //     child:  ListTile(
            //       onTap: (){
            //       },
            //       title: const Text(" Calculator",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30,),),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
