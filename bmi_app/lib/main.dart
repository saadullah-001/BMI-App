import 'package:bmi_app/Splash_screen.dart';
import 'package:bmi_app/screen2.dart';
import 'package:flutter/material.dart';
import 'package:ansicolor/ansicolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade700),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State {
  var HEIGHT = TextEditingController();
  var WEIGHT = TextEditingController();
  String gender = "";
  String result = "";
  String result2 = "";
  String result3 = "";
  Color colors = Colors.indigo.shade200;

  void callback() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Screen2(Colorss: colors, result: result)));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("BMI APP"),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: colors,
            child: Center(
                child: Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI",
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: HEIGHT,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Height in feet and inches(eg. 5'8)",
                        style: TextStyle(fontSize: 18),
                      ),
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.height)),
                      suffix: Text(
                        " Feets and Inches",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Text(
                    "$result2",
                    style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 11,
                        fontStyle: FontStyle.italic),
                  ),
                  TextField(
                    controller: WEIGHT,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Weight in Kilograms(eg. 58kg)",
                        style: TextStyle(fontSize: 18),
                      ),
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.line_weight)),
                      suffix: Text(
                        " KiloGrams",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Text(
                    "$result3",
                    style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 11,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String Sheight = HEIGHT.text.toString();
                      String Sweight = (WEIGHT.text.toString());
                      setState(() {
                        if (Sheight != "" && Sweight != "") {
                          if (Sheight.contains("'")) {
                            var parts = Sheight.split("'");
                            double inches;
                            int feet = int.tryParse(parts[0]) ?? 0;
                            if (Sheight.contains('"')) {
                              inches = double.tryParse(
                                      parts[1].replaceAll('"', ' ')) ??
                                  0;
                            } else {
                              inches = double.tryParse(parts[1]) ?? 0;
                            }
                            inches = inches * 12;
                            double height = feet + inches;
                          }
                          double height = double.tryParse(Sheight) ?? 0.0;
                          double weight = double.tryParse(Sweight) ?? 0.0;

                          height = height * 0.3048;

                          double bmi = weight / (height * height);

                          if (bmi < 18.5) {
                            result = 'Oops, you are Underweight: $bmi';
                            colors = Colors.yellow.shade200;
                            callback();
                          } else if (bmi >= 18.5 && bmi <= 24.9) {
                            result = 'Congrats, You have normal weight: $bmi';
                            colors = Colors.green.shade200;
                            callback();
                          } else if (bmi >= 25 && bmi <= 29.9) {
                            result = 'Oops, you are Overweight: $bmi';
                            colors = Colors.yellow.shade200;
                            callback();
                          } else {
                            result =
                                'You are obese, higher health issues: $bmi';
                            colors = Colors.red.shade200;
                            callback();
                          }
                        } else {
                          // Show error messages separately
                          if (Sheight == "") {
                            result2 = ('Please Fill Height Field !!!');
                          } else {
                            result2 = "";
                          }

                          if (Sweight == "") {
                            result3 = ('Please Fill Weight Field !!!');
                          } else {
                            result3 = "";
                          }
                        }
                      });
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ))));
  }
}
