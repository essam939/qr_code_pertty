library qr_code_pretty;

import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:qr/qr.dart';

import 'qr_pretty_painter.dart';

class QrPretty extends StatefulWidget {
  ///Widget size
  final double size;

  ///Qr code data
  final String data;

  ///Square color
  final Color elementColor;

  ///Error correct level
  final int errorCorrectLevel;

  ///Round the corners
  final bool roundEdges;

  ///Number of type generation (1 to 40)
  final int typeNumber;

  final ImageProvider image;

  QrPretty(
      {Key key,
      this.size = 100,
      @required this.data,
      this.elementColor = Colors.black,
      this.errorCorrectLevel = QrErrorCorrectLevel.M,
      this.roundEdges = false,
      this.typeNumber = 1,
      this.image})
      : super(key: key);

  @override
  _QrPrettyState createState() => _QrPrettyState();
}

class _QrPrettyState extends State<QrPretty> {
  Future<ui.Image> _loadImage(BuildContext buildContext) async {
    final completer = Completer<ui.Image>();

    final stream = widget.image.resolve(ImageConfiguration(
      devicePixelRatio: MediaQuery.of(buildContext).devicePixelRatio,
    ));

    stream.addListener(ImageStreamListener((imageInfo, error) {
      completer.complete(imageInfo.image);
    }, onError: (dynamic error, _) {
      completer.completeError(error);
    }));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return widget.image == null
        ? CustomPaint(
            size: Size(widget.size, widget.size),
            painter: QrPrettyCodePainter(
                data: widget.data,
                errorCorrectLevel: widget.errorCorrectLevel,
                elementColor: widget.elementColor,
                roundEdges: widget.roundEdges,
                typeNumber: widget.typeNumber),
          )
        : FutureBuilder(
            future: _loadImage(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: CustomPaint(
                    size: Size(widget.size, widget.size),
                    painter: QrPrettyCodePainter(
                        image: snapshot.data,
                        data: widget.data,
                        errorCorrectLevel: widget.errorCorrectLevel,
                        elementColor: widget.elementColor,
                        roundEdges: widget.roundEdges,
                        typeNumber: widget.typeNumber),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
  }
}
