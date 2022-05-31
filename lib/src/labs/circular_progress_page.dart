import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class CircularProgressPage extends StatefulWidget {
 
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{


  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  late AnimationController controller;

  @override
  void initState() {

    super.initState();
  
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800)
      );
  

    controller.addListener(() {
      //Siempre el valor del controller irá de 0 a 1, siendo 0 cuando inicia la animación y 1 cuando termina
      //print("Valor controller: ${controller.value}");

      setState(() {
        /*
        Esto lo tome de las preguntas que muestra el curso.
        Hola! Colocándonos en contexto que vamos yendo de 10 en 10 y empezamos en 0,  de acuerdo a 
        lo que hace la fórmula (porcentaje, nuevoPorcentaje, t), nosotros intentamos ir de 0( porcentaje) a 
        10( nuevoPorcentaje ), el valor t indica el rango donde queremos situarnos entre 0 y 10, puede ser 
        cualquier numero [0,1,2,3,4,5,6,7,8,9,10], por ejemplo cuando t es 0 entonces nos situaremos en 
        valor 0 y si t es igual a 1 nos situaremos en 10 (por el valor del controller). Es el único propósito. 
        Ya el controller.listener al estar escuchando todo el forward hará que la barra se mueva de manera 
        animada como si estuviera llenándose y no hacerlo directamente. 
         
         ***Como lo entiendo:
         A porcentaje es como si fueramos asignando un valor de 1 en 1 (en una escala de 1 a 10 que es el 
         valor de NuevoProcentaje que estamos trabajando) esta escala de 1 en 1 se obtiene de controller.value 
         (para indicar que inicio y termino la animación) y cada vez que cambia se redibuja el Widget, 
         dando la simulación de que se esta avanzando poco a poco. 
        */
        
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      
      });
      
    });

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child:  const Icon(Icons.refresh), 
        backgroundColor: Colors.pink,
        onPressed: () {  

            setState(() {

              //porcentaje anterior
              porcentaje = nuevoPorcentaje;

              nuevoPorcentaje += 10;

              if( nuevoPorcentaje > 100) {
                nuevoPorcentaje = 0;
                porcentaje = 0;
              }

              //Se le puede indicar al forward el punto inicial a "reproducir". El 0.0 sería como estar
              //regresando un video al inicio. El valor va de 0 a 1.
              controller.forward(from: 0.0);

            });
        },
      ),

      body: Center(
        child: Container(
          height: 300,
          width:  300,
          padding: const EdgeInsets.all(5),
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiradialProgress(porcentaje),
          ),
        ),
      ),


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