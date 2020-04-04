import 'package:disenios/src/labs/slideshow_page.dart';
import 'package:disenios/src/pages/emergency_page.dart';
import 'package:disenios/src/pages/graficas_circulares_page.dart';
import 'package:disenios/src/pages/headers_page.dart';
import 'package:disenios/src/pages/pinterest_page.dart';
import 'package:disenios/src/pages/sliver_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route> [
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeaderPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Barra progreso', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverPage())
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}