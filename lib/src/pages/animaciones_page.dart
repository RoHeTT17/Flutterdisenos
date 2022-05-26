import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
 
  const AnimacionesPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado()
     ),
   );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotacion;

  Animation<double>? opacidad;
  Animation<double>? opacidadOut;

  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  @override
  void initState() {
    // inicializar
    controller = AnimationController(
      vsync: this, //Aqui se manda this, porque se esta haciendo referencia al SingleTickerProviderStateMixin
      duration: const Duration(milliseconds:4000) //Duración de la animación
    );  

    //Los valores en que pasa la rotación
    //Se multiplica por pi para que la vuelta sea exacta de  180° (creo que es el valor de pi)
  
    //Animación lineal
    // rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);

    //Con Curve
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(CurvedAnimation(
      parent: controller, 
      curve: Curves.easeOut));

    //Valores para la animación de la opacidad
    //Lineal
    // opacidad = Tween(begin: 0.1, end: 1.0).animate(controller);
    //Con curve
    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: controller, 
      //Los valores de interval indican cuando iniciar y terminar la animación, pero esos valores se 
      //defienen como porcentajes respecto al tiempo indicado en el AnimationCotroller 
      //El Interval es un tipo de curve especial y su valores van de un rango de 0 a 1
      curve: const Interval(0.1 , 0.35, curve: Curves.easeOut)
    ));

    opacidadOut = Tween(begin: 0.0, end: 0.1).animate(CurvedAnimation(
      parent: controller, 
      curve: const Interval(0.75 , 1.0, curve: Curves.easeOut)
    ));


    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(controller); 
    
    //En este caso indica que inica en 0 su tamaño y al fina tendrá 2 veces su tamaño original
    //(esto al aplicarse en el scale)
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)); 

    controller.addListener(() {

        // print('Status: +${controller.status}');

        if(controller.status == AnimationStatus.completed){
          //controller.reverse();
          controller.reset();
         }//else if (controller.status == AnimationStatus.dismissed){
        //   controller.forward();
        // }

    });

    super.initState();

  }

  @override
  void dispose() {
    // destruir el controller
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   

    //play / Reporducción
    controller.forward();
    // controller.repeat();

    return AnimatedBuilder(
      animation: controller, //Quien controla la animación
      child: _Rectangulo(), // Es opcional, si aquí se define el child, seria el que se recibe dentro del builder
      builder: (BuildContext context, Widget? childrectangulo) {
        //Se cola este transform en la parte superior, porque si no el movimiento de desplazarse sería raro. 
        return Transform.translate(
          //En este caso las coordenas del Offset son relativas a la ubicación actual del widget.
          //0 , 0 indicaria la posición actual del widget.
          offset: Offset(moverDerecha!.value,0), 
          child: Transform.rotate(
                                  angle:  rotacion.value,
                                  child:  Opacity(
                                    //Se resta para que al final de la animación no la opacidad sea 0
                                    opacity: opacidad!.value - opacidadOut!.value,
                                    child: Transform.scale(
                                       scale: agrandar!.value,
                                       child: childrectangulo
                                      ),
                                  ),
         //child: _Rectangulo()
                                ),
        );
      },
    );
  }

}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.red
       ),
     );
   }
}