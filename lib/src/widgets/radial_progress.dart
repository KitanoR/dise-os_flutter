import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;
  
  const RadialProgress({ 
    @required this.porcentaje, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.grosorSecundario = 4, 
    this.grosorPrimario = 10,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin  {
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200)
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    controller.forward(from:0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    final calculo = (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value);
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorSecundario,
              widget.grosorPrimario
            )
          )
        );
      },
    );

    /*  */
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;
  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario, 
    this.colorSecundario, 
    this.grosorSecundario, 
    this.grosorPrimario
  );
  @override
  void paint(Canvas canvas, Size size) {
    // Circulo inicial de progreso
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;
    
    final center = new Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);
    // ARco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color       = colorPrimario
      ..strokeCap   = StrokeCap.round
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