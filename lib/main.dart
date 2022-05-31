import 'package:flutter/material.dart';
import 'package:disenos/src/pages/graficas_circulares_page.dart';

//import 'package:disenos/src/labs/circular_progress_page.dart';
//import 'package:disenos/src/retos/cuadrado_animado_page.dart';
//import 'package:disenos/src/pages/animaciones_page.dart';
//import 'package:disenos/src/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: GrafciasCircularesPage(),
   );
  }
}