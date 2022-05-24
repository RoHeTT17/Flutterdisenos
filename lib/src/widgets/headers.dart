// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB), 

    );
  }
}

class HeaderBordesRedondos extends StatelessWidget {
  const HeaderBordesRedondos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color:  Color(0xff615AAB), 
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        ) 
      ),

    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      //color: const Color(0xff615AAB), 
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // El size, es el tamaño que difinimos en el height y width del container

    //Crear objeto (es como si fuera un lapiz)
    final paint =  Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB); //Color de la linea
    // paint.style = PaintingStyle.stroke; // Para solo dibujar lineas
    paint.style = PaintingStyle.fill; // Para rellenar el contenido
    paint.strokeWidth = 2; //Grosor de la linea

    //Como queremos mover el lapiz
    final path = Path();  

    //Dibujar con el path y el lapiz
    //moveTo, es como levantar el lapiz para colocarlo en cierto lugar sin que dibuje
    //lineTo, sirve para dibujar la linea

    path.moveTo(0 , size.height *0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width,0);
    path.lineTo(0, 0);

    //Dibujar en el canvas 
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      //color: const Color(0xff615AAB), 
      child: CustomPaint(
        painter: _HeaderTriangular(),
      ),
    );
  }
}

class _HeaderTriangular extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // El size, es el tamaño que difinimos en el height y width del container

    //Crear objeto (es como si fuera un lapiz)
    final paint =  Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB); //Color de la linea
    //paint.style = PaintingStyle.stroke; // Para solo dibujar lineas
    paint.style = PaintingStyle.fill; // Para rellenar el contenido
    paint.strokeWidth = 2; //Grosor de la linea

    //Como queremos mover el lapiz
    final path = Path();  

    //Dibujar con el path y el lapiz
    //moveTo, es como levantar el lapiz para colocarlo en cierto lugar sin que dibuje
    //lineTo, sirve para dibujar la linea

    //path.moveTo(0 , size.height *0.35);
    path.lineTo(size.width,0);
    //path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
     //path.lineTo(0, size.height);
    //path.lineTo(size.width, size.height*0.30);
 
    //Dibujar en el canvas 
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      //color: const Color(0xff615AAB), 
      child: CustomPaint(
        painter: _HeaderPico(),
      ),
    );
  }
}

class _HeaderPico extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // El size, es el tamaño que difinimos en el height y width del container

    //Crear objeto (es como si fuera un lapiz)
    final paint =  Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB); //Color de la linea
    //paint.style = PaintingStyle.stroke; // Para solo dibujar lineas
    paint.style = PaintingStyle.fill; // Para rellenar el contenido
    paint.strokeWidth = 22; //Grosor de la linea

    //Como queremos mover el lapiz
    final path = Path();  

    //Dibujar con el path y el lapiz
    //moveTo, es como levantar el lapiz para colocarlo en cierto lugar sin que dibuje
    //lineTo, sirve para dibujar la linea

    path.lineTo(size.width,0);
    path.lineTo(size.width, size.height*0.25);
    path.lineTo(size.width*0.5, size.height*0.30);
    path.lineTo(0,size.height*0.25);
    //path.lineTo(size.width, size.height*0.30);
 
    //Dibujar en el canvas 
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      //color: const Color(0xff615AAB), 
      child: CustomPaint(
        painter: _HeaderCurvo(),
      ),
    );
  }
}

class _HeaderCurvo extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // El size, es el tamaño que difinimos en el height y width del container

    //Crear objeto (es como si fuera un lapiz)
    final paint =  Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB); //Color de la linea
    //paint.style = PaintingStyle.stroke; // Para solo dibujar lineas
    paint.style = PaintingStyle.fill; // Para rellenar el contenido
    paint.strokeWidth = 22; //Grosor de la linea

    //Como queremos mover el lapiz
    final path = Path();  

    path.lineTo(0,size.height*0.25);

    //Para dibujar curvas:
    //Los primeros dos parámetros indican el punto del eje de la curva, donde queremos que haga la curva
    //Los ultimos dos en donde termina la cuarva
    //path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height*0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height);
    path.lineTo(size.width, 0); 

    //Dibujar en el canvas 
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class HeaderWave extends StatelessWidget {
  const HeaderWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      //color: const Color(0xff615AAB), 
      child: CustomPaint(
        painter: _HeaderWave(),
      ),
    );
  }
}

class _HeaderWave extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // El size, es el tamaño que difinimos en el height y width del container

    //Crear objeto (es como si fuera un lapiz)
    final paint =  Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB); //Color de la linea
    //paint.style = PaintingStyle.stroke; // Para solo dibujar lineas
    paint.style = PaintingStyle.fill; // Para rellenar el contenido
    paint.strokeWidth = 5; //Grosor de la linea

    //Como queremos mover el lapiz
    final path = Path();  

    //Para dibujar curvas:
    //Los primeros dos parámetros indican el punto del eje de la curva, donde queremos que haga la curva
    //Los ultimos dos en donde termina la curva

    //Curva superior
    path.lineTo(0,size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height * 0.30, size.width*0.50, size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height * 0.20, size.width, size.height*0.25);
    path.lineTo(size.width,0);

     //Inferior
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.25, size.height * 0.70, size.width*0.50, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.75, size.height * 0.80, size.width, size.height*0.75);
    // path.lineTo(size.width, size.height);

    //Dibujar en el canvas 
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class HeaderWaveGradiant extends StatelessWidget {
  const HeaderWaveGradiant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      //color: const Color(0xff615AAB), 
      child: CustomPaint(
        painter: _HeaderWaveGradiant(),
      ),
    );
  }
}

class _HeaderWaveGradiant extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // El size, es el tamaño que difinimos en el height y width del container

    const Gradient gradiante = LinearGradient(
      begin: Alignment.topCenter, //Con esto el grandiente se vuelve vertical
      end:  Alignment.bottomCenter, //Con esto el grandiente se vuelve vertical
      colors:  <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],

      stops: [
        0.0,
        0.5,
        1.0
      ]

    );
   

    final Rect rect = Rect.fromCircle(
       center: const Offset(0.0, 55.0), 
       radius: 180
    );


    //Crear objeto (es como si fuera un lapiz)
    final paint =  Paint()..shader = gradiante.createShader(rect);

    //Propiedades
    paint.color = const Color(0xff615AAB); //Color de la linea
    //paint.style = PaintingStyle.stroke; // Para solo dibujar lineas
    paint.style = PaintingStyle.fill; // Para rellenar el contenido
    paint.strokeWidth = 5; //Grosor de la linea

    //Como queremos mover el lapiz
    final path = Path();  

    //Curva superior
    path.lineTo(0,size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height * 0.30, size.width*0.50, size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height * 0.20, size.width, size.height*0.25);
    path.lineTo(size.width,0);

    //Dibujar en el canvas 
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}