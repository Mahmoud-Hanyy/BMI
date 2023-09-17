import 'dart:math';

import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
bool isMale = true;
double height = 120.0;
int weight = 40;
int age=  16 ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('BMI Calculator',),
        centerTitle: true,
        ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? Colors.blue : Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage("assets/images/man.png"),
                                height: 90.0,
                                width: 90.0,
                              ),
                              SizedBox(height: 15.00,),
                              Text("MALE"
                                ,style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                        setState(() {
                          isMale = false;
                        });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !isMale ? Colors.blue : Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 100.0,
                              ),
                              SizedBox(height: 15.00,),
                              Text("FEMALE"
                                ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.00
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[400]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT",
                        style: TextStyle(
                            fontSize: 20.0,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.00,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text("${height.round()}",
                            style: TextStyle(
                                fontSize: 40.0,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10.0,),
                          Text("CM",
                            style: TextStyle(
                                fontSize: 20.0,),),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220.0,
                          min: 80.0,
                          onChanged:(value){
                            setState(() {
                              height = value;
                            });
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[400]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AGE",
                              style: TextStyle(
                                  fontSize: 25.0,fontWeight: FontWeight.bold),),
                            Text("${age}",
                              style: TextStyle(
                                  fontSize: 40.0,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: "age--",
                                  onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  child: Icon(Icons.remove),
                                  mini: true,
                                ),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  child: Icon(Icons.add),
                                  mini: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[400]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT",
                              style: TextStyle(
                                  fontSize: 25.0,fontWeight: FontWeight.bold),),
                            Text("${weight}",
                              style: TextStyle(
                                  fontSize: 40.0,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  child: Icon(Icons.remove),
                                  mini: true,
                                ),
                                FloatingActionButton(
                                  heroTag: "weight++",
                                  onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                  child: Icon(Icons.add),
                                  mini: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(
                height: 50.0,
                onPressed: (){
                  double result = weight / pow(height/100, 2);
                  print(result.round());
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>BmiResult(
                            result: result.round(),
                            isMale: isMale,
                            age: age,
                          )
                          ),
                  );
                },
                child: Text('CALCULATE',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
            )
          ],
        ),
      ),
      );
  }
}
