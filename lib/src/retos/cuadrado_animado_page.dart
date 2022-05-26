import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatelessWidget {
 
  const CuadradoAnimadoPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _CuadradoAnimado())
   );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

AnimationController? controller;
//animaciones
Animation<double>? moveRight;
Animation<double>? moveUp;
Animation<double>? moveLeft;
Animation<double>? moveDown;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500)
      );


    controller!.addListener(() {
      
        if(controller!.status == AnimationStatus.completed)
            controller!.reset();

    });

    /*
    //Asi lo hice yo
    moveRight = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.0, 0.25, curve: Curves.bounceOut), )
    );

    moveUp = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.25, 0.50, curve: Curves.bounceOut), )
    );

    moveLeft = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.50, 0.75, curve: Curves.bounceOut), )
    );

    moveDown = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.75, 1.0, curve: Curves.bounceOut), )
    );
    */

    /*
    Los valores de la animación dependen del tiempo en el que se encuentre el intervalo, es decir si el 
    intervalo esta definido en (0.25,0.50), el valor de la animación antes del 0.25 será de cero, e ira
     incrementado o decreciendo según sea el caso, hasta llegar a 0.50.
    */ 


    moveRight = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.0, 0.25, curve: Curves.bounceOut), )
    );

    moveUp = Tween(begin: 0.0, end: -120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.25, 0.50, curve: Curves.bounceOut), )
    );

    moveLeft = Tween(begin: 0.0, end: -120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.50, 0.75, curve: Curves.bounceOut), )
    );

    moveDown = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval( 0.75, 1.0, curve: Curves.bounceOut), )
    );


  }


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller!.dispose();

  }
  
  @override
  Widget build(BuildContext context) {

    controller!.forward();

    return AnimatedBuilder(
      animation: controller!,
      child:     _Rectangulo(),
      builder: (BuildContext context, Widget? childRect) {

        return Transform.translate(
          //se pueden sumar por como esta definidos los valores en los Interval
          offset: Offset(moveRight!.value + moveLeft!.value, moveUp!.value+moveDown!.value),
          child: childRect

          );


      /*
        //Asi lo hice yo
        return Transform.translate(
          offset: Offset(moveRight!.value,0),
          child: Transform.translate(
                                    offset: Offset(0,-moveUp!.value),
                                    child: Transform.translate(
                                                          offset: Offset(-moveLeft!.value,0),
                                                          child: Transform.translate(
                                                                            offset: Offset(0,moveDown!.value),
                                                                            child: childRect
                                                                            )
                                                          )
                                    ),

        );
      */  

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
         color: Colors.blue
       ),
     );
   }
}