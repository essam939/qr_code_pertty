# qr_code_pretty

fast QR code rendering via a Widget or custom painter. You can round the edges with parameter or use the standard view.

## Features

* Created with [QR dart](https://github.com/mido9000)

## Screenshots

  <img src="https://github.com/mido9000/qr_code_pertty/blob/master/images/Scr1.png" width="250"> 

  <img src="https://github.com/mido9000/qr_code_pertty/blob/master/images/Scr2.png" width="250"> 

  <img src="https://github.com/mido9000/qr_code_pertty/blob/master/images/Scr3.png" width="250"> 



## Example

```dart
import 'package:flutter/material.dart';
import 'package:qr_code_pretty/qr_code_pretty.dart';
import 'package:qr/qr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: QrCodePretty(
                image: AssetImage('images/man.png'),
                typeNumber: 10,
                size: 300,
                data: 'https://www.google.com',
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true)),
      ),
    );
  }
}
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
