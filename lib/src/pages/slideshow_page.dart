import 'package:disenios/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
//TODO Borrar
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: MiSlideShow(),
          ),
          Expanded(
            child: MiSlideShow(),
          )
          
          
        ],
      )
    );
  }
}

class MiSlideShow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      puntosArriba: false,
      colorPrimario: Colors.pink,
      bulletPrimario: 15,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}
