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
     
      body: Center(
        child: Container(
          width: 300,
          height: 300,
         // color: Colors.red,
          child: RadialProgress(porcentaje: porcentaje,)//Text('$porcentaje %',style: const TextStyle(fontSize: 50.0),),
        )
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