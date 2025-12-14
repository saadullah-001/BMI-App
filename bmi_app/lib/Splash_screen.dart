import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });

    return Scaffold(
        body: Container(
      color: Colors.deepPurple,
      child: Center(
          child: Text(
        "SAAD BMI APP",
        style: TextStyle(
            fontSize: 58, fontWeight: FontWeight.w700, color: Colors.white70),
      )),
    ));
  }
}
