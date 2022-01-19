import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:math' as math;

class DummyAvatar extends StatelessWidget {
  final double radius;
  final String name;
  const DummyAvatar({Key? key, this.radius = 15.0, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFAvatar(
      child: Text(
        name[0],
        style: Theme.of(context).textTheme.headline5,
      ),
      radius: radius,
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(0.5),
    );
  }
}
