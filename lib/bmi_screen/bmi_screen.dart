import 'dart:math';

import 'package:bmi/resault.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
   BmiCalculatorScreen({Key? key}) : super(key: key);


  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  var height = 180.0;
  var age = 26;
  var weight = 60;
  var color = Colors.blue;
  var isMale = true;
  var isFemale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CACULATOR')),),
      body: Column(
        children: [
          //Gender Row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isMale = !isMale;
                        });
                      },
                      child: Container(
                        color: isMale? color : Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,
                              size: 40,
                            ),
                            SizedBox(height: 20.0,),
                            Text('Male',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight:FontWeight.bold,
                              ),
                            )
                          ],),
                      ),
                    ),
                  ),
                ),
                //  const SizedBox(width: 10.0,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isMale = !isMale;
                        });
                      },
                      child: Container(
                        color: isMale? Colors.grey: color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,
                              size: 40,
                            ),
                            SizedBox(height: 20.0,),
                            Text('Female',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight:FontWeight.bold,
                              ),
                            )
                          ],),
                      ),
                    ),
                  ),
                ),

              ],),
          ),
          //Height Row
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                color: Colors.grey[400],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Height',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',
                          style: TextStyle(
                            fontWeight:FontWeight.bold,

                            fontSize: 30,
                          ),
                        ),
                        const Text('cm',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),

                    Slider(
                        value: height ,
                        max: 210,
                        min: 40,
                        onChanged: (value){
                          setState((){
                             height=value;
                          });

                        },

                    ),
                  ],
                ),
              ),
            ),
          ),
          //Weight & Age Row
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('WEIGHT',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Text('${weight}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight:FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){setState(() {weight--;});},
                                child: Icon(Icons.remove,
                                size: 30,
                                ),
                                mini: true,

                              ),
                               SizedBox(width: 15.0,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              }, child: Icon(Icons.add,
                                size: 30,
                              ),
                              mini: true,),
                            ],)
                        ],),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('AGE',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Text('${age}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight:FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }, child: Icon(Icons.remove,
                                size: 30,
                              ),
                              mini: true,),
                              SizedBox(width: 10,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }, child: Icon(Icons.add,
                                size: 30,
                              ),
                              mini: true,),
                            ],)
                        ],),
                    ),
                  ),

                ],),
            ),
          ),

          Container(
            //clipBehavior: Clip.antiAliasWithSaveLayer,
            width: double.infinity,
            height: 40.0,
            child: MaterialButton(
              onPressed: (){
                double result = weight / pow(height / 100, 2);
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        isMale : isMale,
                        height : height.round(),
                        age : age,
                        weight : weight,
                        result : result.round(),
                      ),));
              },
              child: Text('CALCULATE'),
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
