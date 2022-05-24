import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // inicializar
    controller = AnimationController(
      vsync: this, //Aqui se manda this, porque se esta haciendo referencia al SingleTickerProviderStateMixin
      duration: const Duration(milliseconds:4000) //Duración de la animación
    );  

    //Que tipo animación queremos
    rotacion = Tween(begin: 0.0, end: 2.0).animate(controller);

  }

  @override
  void dispose() {
    // destruir el controller
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
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