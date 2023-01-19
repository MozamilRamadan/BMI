import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  late bool isMale;
  late int age;
  late int weight;
  late int height;
  late int result;
  ResultScreen({
    required this.isMale,
    required this.result,
    required this.weight,
    required this.height,
    required this.age,
  });
 // ResultScreen( {Key? key, required bool isMale, required int height, required int weight,required int age, required int result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('GENDER : ${isMale ? 'Male' : 'Female'}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            ),
            const SizedBox(height: 10.0,),
            Text('HEIGHT : $height',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            ),
            const SizedBox(height: 10.0,),

            Text('WEIGHT : $weight',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            ),
            const SizedBox(height: 10.0,),

            Text('AGE : $age',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            ),
            const SizedBox(height: 10.0,),

            Text('Result : ${result}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
