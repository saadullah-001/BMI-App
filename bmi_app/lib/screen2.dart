import 'package:bmi_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Color Colorss = Colors.yellow.shade200;
  String result;

  Screen2({required this.Colorss, this.result = "Something is wrong"});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colorss,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$result",
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Text(
                "Return",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colorss))
        ],
      )),
    ));
  }
}
