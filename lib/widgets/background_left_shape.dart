import 'package:flutter/material.dart';
import 'package:flutter_bmi_application/constants/contants.dart';

class LeftShape extends StatelessWidget {
  final double width;
  const LeftShape({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40.0,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
            color: greenBackground,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'شاخص مثبت',
          style: TextStyle(color: greenBackground),
        )
      ],
    );
  }
}
