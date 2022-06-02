import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/radial_progress.dart';

class GrafciasCircularesPage extends StatefulWidget {
 
  const GrafciasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GrafciasCircularesPage> createState() => _GrafciasCircularesPageState();
}

class _GrafciasCircularesPageState extends State<GrafciasCircularesPage> {
  
  double porcentaje = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgres(porcentaje: porcentaje,customColor: Colors.pink,),
              _CustomRadialProgres(porcentaje: porcentaje,customColor: Colors.purple),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgres(porcentaje: porcentaje,customColor: Colors.green),
              _CustomRadialProgres(porcentaje: porcentaje,customColor: Colors.yellow),
            ],
          ),

        ],
      ), 

     floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.refresh),
       onPressed: () {  
          setState(() {
            porcentaje += 10;

            if(porcentaje >100){
              porcentaje = 0;
            }

          });
      },),
   );
  }
}

class _CustomRadialProgres extends StatelessWidget {

  final double porcentaje;
  final Color customColor;

  const _CustomRadialProgres({
    Key? key,
    required this.porcentaje, 
    required this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
     // color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorSecundario: Colors.blue,
        colorPrimario: customColor,
        )//Text('$porcentaje %',style: const TextStyle(fontSize: 50.0),),
    );
  }
}