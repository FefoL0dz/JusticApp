import 'package:flutter/material.dart';

class WeirdBorder extends ShapeBorder {
  final double radius;
  final double pathWidth;

  WeirdBorder({@required this.radius, this.pathWidth = 1});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect, textDirection: textDirection), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => _createPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => WeirdBorder(radius: radius);

  Path _createPath(Rect rect) {
    final innerRadius = radius + pathWidth;
    final innerRect = Rect.fromLTRB(rect.left + pathWidth, rect.top + pathWidth, rect.right - pathWidth, rect.bottom - pathWidth);

    final outer = Path.combine(PathOperation.difference, Path()..addRect(rect), _createBevels(rect, radius));
    final inner = Path.combine(PathOperation.difference, Path()..addRect(innerRect), _createBevels(rect, innerRadius));
    return Path.combine(PathOperation.difference, outer, inner);
  }

  Path _createBevels(Rect rect, double radius) {
    return Path()
      ..addOval(Rect.fromCircle(center: Offset(rect.left, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left + rect.width, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left, rect.top + rect.height), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left + rect.width, rect.top + rect.height), radius: radius));
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 300,
            height: 200,
            margin: const EdgeInsets.only(top: 24, bottom: 16),
            decoration: ShapeDecoration(shape: WeirdBorder(radius: 32), color: Colors.red),
          ),
          Container(
            width: 200,
            height: 100,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: ShapeDecoration(shape: WeirdBorder(radius: 16, pathWidth: 8), color: Colors.green),
          ),
          Container(
            width: 300,
            height: 200,
            decoration: ShapeDecoration(shape: WeirdBorder(radius: 12, pathWidth: 2), color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(), body: Demo()));
  }
}