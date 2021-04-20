import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ShaderMask(
        shaderCallback: (bounds) => RadialGradient(
          center: Alignment.topLeft,
          radius: 1.0,
          colors: [
            Colors.yellow,
            Colors.deepOrange,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds),
        child: Text(
          'Burning Test!',
          style: TextStyle(color: Colors.white, fontSize: 42),
        ),
      ),
    ));
  }
}
