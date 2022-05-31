import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {

  final porcentaje;

  const RadialProgress({Key? key, required this.porcentaje}) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  double? porcentajeAnterio;

  @override
  void initState() {
    super.initState();
    //Cuando se dibuja por primera vez el widget ( el init state solo corre una vez), 
    //igualar el porcentaje anterior al porcentaje que se recibe
    porcentajeAnterio = widget.porcentaje;

    controller = AnimationController(vsync: this, duration:const Duration(milliseconds: 200) );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0);  

    // Aquí nos dice el procentaje a animar
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterio;
    //Tener el porcentaje después de la diferencia
    porcentajeAnterio = widget.porcentaje;


    //Crear la animación
    return AnimatedBuilder(
      animation: controller,
      //child: child,
      builder: (BuildContext context, Widget? child) {
              return  Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              height: double.infinity,
                              //child: Text('${widget.porcentaje}'),
                              child: CustomPaint(painter: _MiradialProgress(
                                //widget.porcentaje
                                (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value)
                                )),
                          );
            },
          );
  
  }

}

class _MiradialProgress extends CustomPainter{

  final porcentaje;

  _MiradialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
     
    //Dibujar Ciculo
    //Definir propiedades del lapiz
    final paint = Paint()
    ..strokeWidth = 4
    ..color       = Colors.grey
    ..style       = PaintingStyle.stroke;

     //Propiedades para dibujar el circulo
     //como el painter esta dentro del container, el canvas es el tamaño del container
     Offset center = Offset(size.width*0.5, size.height*0.5);

     //Radio del circulo
     double radio = min(size.width*0.5, size.height*0.5); 

     //Dibujar un circulo
     canvas.drawCircle(center, radio, paint) ;

    //Dibujar el arco
    final paintArco = Paint()
    ..strokeWidth = 10
    ..color       = Colors.pink
    ..style       = PaintingStyle.stroke;

    //Parte que se deberá ir llenando
    //2 * pi estodo un ciruclo, depués e multiplica por el porcentaje
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
     Rect.fromCircle(center: center, radius: radio), //rect. Se podria definir como el espacio donde lo queremos ubicar
     -pi /2,    // startAngle
     arcAngle,  // sweepAngle
     false,     // useCenter
     paintArco
     );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}