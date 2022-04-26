import 'package:flutter/material.dart';
import 'package:flutter_bmi_application/constants/contants.dart';

class RightShape extends StatelessWidget {
  final double width;
  const RightShape({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'شاخص منفی',
          style: TextStyle(color: redBackground),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 40.0,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
            ),
            color: redBackground,
          ),
        ),
      ],
    );
  }
}
