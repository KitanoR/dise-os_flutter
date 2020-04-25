import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB)
    );
  }
}

class HeaderBordeRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
          )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;
    
    final path = new Path();

    // dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}




class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;
    
    final path = new Path();

    // dibujar con el path y el lapiz
    path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}



class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;
    
    final path = new Path();

    // dibujar con el path y el lapiz
    path.moveTo(0, size.height * .25);
    path.lineTo(size.width * 0.5 , size.height * .33);
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


class HeaderCurva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvaPainter(),
      ),
    );
  }
}

class _HeaderCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    
    final path = new Path();

    // dibujar con el path y el lapiz
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width *0.5, size.height * 0.45, size.width, size.height * .25);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * .25);
   


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class HeaderWave extends StatelessWidget {

  final Color color;

  const HeaderWave({
   @required  this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavePainter(color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;

  _HeaderWavePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color =  color; //Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    
    final path = new Path();

    // dibujar con el path y el lapiz
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width *0.25, size.height * 0.30, size.width * 0.5, size.height * .25);
    path.quadraticBezierTo(size.width *0.72, size.height * 0.20, size.width, size.height * .25);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * .25);
   


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


class HeaderIcon extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;
  
  final Color colorBlanco = Colors.white.withOpacity(0.7);

  HeaderIcon({
    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey,
    this.color2 =  Colors.blueGrey
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(color1, color2),
        Positioned(
          top: -50.0,
          left: -70.0,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 80, width: double.infinity),
            Text(
              subtitulo,
              style: TextStyle(
                fontSize: 20,
                color: colorBlanco
              ),
            ),
            SizedBox(height: 20,),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 25,
                color: colorBlanco,
                fontWeight: FontWeight.bold
              ),
            ),
            FaIcon(
              icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  
  final Color color1;
  final Color color2;

  _IconHeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            color1,
            color2
          ]
        )
      ),
    );
  }
}


class HeaderWaveGradient extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      radius: 180,
      center: Offset(0.0, 55.0)
    );

    final Gradient gradiente= LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color> [
        Color(0xFF6D05E8),
        Color(0xFFC012FF),
        Color(0xFF6D05FA),
      ],
      stops: [
        0.0,
        0.5,
        1.0
      ]
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // propiedades
    lapiz.color =  Colors.red; //Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    
    final path = new Path();

    // dibujar con el path y el lapiz
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width *0.25, size.height * 0.30, size.width * 0.5, size.height * .25);
    path.quadraticBezierTo(size.width *0.72, size.height * 0.20, size.width, size.height * .25);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * .25);
   


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}