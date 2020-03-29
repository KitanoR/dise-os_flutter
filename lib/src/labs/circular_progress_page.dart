import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  
  
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800)
    );
    controller.addListener(() {
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if(nuevoPorcentaje > 100){
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  _MiRadialProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
    // Circulo inicial de progreso
    final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;
    
    final center = new Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);
    // ARco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.orange
      ..style       = PaintingStyle.stroke;
    //Parte para llenar
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}