import 'package:flutter/material.dart';
import 'package:qr_code_pretty/qr_code_pretty.dart';
import 'package:qr/qr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: QrCodePretty(
                    // image: AssetImage('images/man.png'),
                      typeNumber: 5,
                      elementColor: Colors.black,
                      size: 300,
                      data: 'https://www.google.com',
                      errorCorrectLevel: QrErrorCorrectLevel.M,
                      roundEdges: true),
                ),
              ),
            )));
  }
}
