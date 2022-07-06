import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/widgets/headers.dart';
import 'package:disenos/src/widgets/boton_gordo.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {
 
  const EmergencyPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {

    bool isLarge;

    if(MediaQuery.of(context).size.height > 550){
      isLarge = true;
    }else{
      isLarge = false;
    }  

  final items = <ItemBoton>[
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  ];

    //Convertir un listado de items a un listado de Widgets
    List<Widget> itemMap = items.map(
      (e) => FadeInLeft(
        //duration: const Duration(milliseconds: 1500),
        child: BotonGordo(icon: e.icon,texto: e.texto,color1: e.color1,color2: e.color2 ,onPress: (){print('Holis');}))
      ).toList();

    return Scaffold(
      //backgroundColor: Colors.red, //solo es para validar que el icono no salga del botón
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: (isLarge)? 220 : 20),
            child: SafeArea(
              child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
            
                            if(isLarge)
                               const SizedBox(height: 80,),
            
                            ...itemMap //desplegar todo el listado
                      ],
              ),
            ),
          ),

          //Entre mas abajo se esta en el código significa que esta mas arriba en la pantalla
          //Si es bastante largo, mostrar el encabezado
          if(isLarge)
             const _Header()
        ],
      )
   );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
                    icon: FontAwesomeIcons.plus, 
                    titulo: 'Asistencia Médica', 
                    subTitulo: 'Haz solicitado',
                    color1: const Color(0xff536CF6),
                    color2: const Color(0xff66A9F2), 
        ),

        //Agregar botón menú
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
             shape:   const CircleBorder(), //Al dar Tab sobre el botón, muestra un circulo al rededor
             padding: const EdgeInsets.all(15),
             child:   const FaIcon(FontAwesomeIcons.ellipsisVertical,color: Colors.white,),
             onPressed: () {  },
            )
       )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(texto: 'Motor Accident',icon: FontAwesomeIcons.carBurst,color1: Color(0xff6989F5), color2: Color(0xff906EF5),onPress: (){print("Holis");},);
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
                      icon: FontAwesomeIcons.plus, 
                      titulo: "Asistencia Médica",
                      subTitulo: "Haz Solicitado",
                      color1: const Color(0xff526BF6),
                      color2: const Color(0xff67ACF2),
                    );
  }
}