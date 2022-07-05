import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/pages/slide_page.dart';
import 'package:disenos/src/pages/emergency_page.dart';
import 'package:disenos/src/pages/graficas_circulares_page.dart';
import 'package:disenos/src/pages/headers_page.dart';
import 'package:disenos/src/pages/sliver_list_page.dart';
import 'package:disenos/src/retos/cuadrado_animado_page.dart';
import 'package:disenos/src/pages/pinterest_page.dart';

class _Route{

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);

}

final pageRoutes = <_Route>[
    _Route(FontAwesomeIcons.slideshare,    'Slideshow',     SlidePage()),
    _Route(FontAwesomeIcons.truckMedical,  'Emergencia',    EmergencyPage()),  
    _Route(FontAwesomeIcons.heading,       'Encabezados',   HeaderPage()),
    _Route(FontAwesomeIcons.peopleCarryBox,'Cuadro Animado',CuadradoAnimadoPage()),
    _Route(FontAwesomeIcons.circleNotch,   'Barra Progreso',GrafciasCircularesPage()),
    _Route( FontAwesomeIcons.pinterest ,   'Pinterest',     PinterestPage() ),
    _Route(FontAwesomeIcons.mobile,        'Slivers',       SliverListPage()),



];