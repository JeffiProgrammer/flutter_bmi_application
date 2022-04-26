import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bmi_application/constants/contants.dart';
import 'package:flutter_bmi_application/widgets/background_left_shape.dart';
import 'package:flutter_bmi_application/widgets/background_right_shape.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  Color resultColor = blackColor;
  double widthGood = 100.0;
  double widthBad = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'تو چنده ؟ BMI',
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: redBackground,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'kg وزن',
                      hintStyle: TextStyle(
                        color: redBackground.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: redBackground,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'cm قد',
                      hintStyle: TextStyle(
                        color: redBackground.withOpacity(0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                final weight = double.parse(weightController.text);
                final heigth = (double.parse(heightController.text)) / 100;

                setState(() {
                  resultBMI = weight / pow(heigth, 2);
                  if (resultBMI > 25) {
                    resultText = 'شما اضافه وزن دارید';
                    resultColor = redBackground;
                    widthBad = 270;
                    widthGood = 50;
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                    resultText = 'وزن شما نرمال است';
                    resultColor = greenBackground;
                    widthBad = 50;
                    widthGood = 270;
                  } else {
                    resultText = 'وزن شما کمتر از حد نرمال است';
                    resultColor = blackColor;
                    widthBad = 10;
                    widthGood = 10;
                  }
                });
              },
              child: Text(
                '! محاسبه کن ',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              '${resultBMI.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold,color: resultColor),
            ),
            Text(
              '$resultText',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: resultColor),
            ),
            SizedBox(height: 30.0),
            RightShape(width: widthBad),
            SizedBox(height: 15.0),
            LeftShape(width: widthGood),
          ],
        ),
      ),
    );
  }
}
