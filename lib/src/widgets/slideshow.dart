
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//Se comenta para no tener como dependencia el slider_model.dart, por la conficguración de las propiedades en los puntos
//import 'package:disenos/src/models/slider_model.dart';

//TODO: Para no condicionar a que solo sean SVGs
//import 'package:flutter_svg/flutter_svg.dart';

class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool? dotsTop;
  final Color? colorPrimario; //El activo
  final Color? colorSecundario; //inactivo
  final double? bulletPrimario;
  final double? bullerSecundario;
  
  const Slideshow({
    Key? key, 
    required this.slides, 
    this.dotsTop           = false, 
    this.colorPrimario     = Colors.purple, 
    this.colorSecundario   = Colors.grey,
     this.bulletPrimario   = 12, 
     this.bullerSecundario = 12
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
      return ChangeNotifierProvider(
        create: (context) => new _SliderShowMoidel(),//SliderMoidel(),
        child: SafeArea(
          child: Center(
            /*Para poder instanciar los colores atraves del Provider, se uso el widget Builder, este widget
              lo que hace es primero construir el widget que lo contiene (en este caso el Center, SafeArea, CahngeNotifier)
              y después crea lo que esta dentro de us propiedad builder. Sin esto, tendriamos que instanciar
              el provider un nivel más arriba y eso arruinaría que el widget sea reutilizable.
            */  
            child:Builder(
              builder: (BuildContext context) {

                  Provider.of<_SliderShowMoidel>(context).setColorPrimario    = this.colorPrimario!;
                  Provider.of<_SliderShowMoidel>(context).setColorSecundario  = this.colorSecundario!;
                  Provider.of<_SliderShowMoidel>(context).setBulletPrimario   = this.bulletPrimario!;
                  Provider.of<_SliderShowMoidel>(context).setBullerSecundario = this.bullerSecundario!;
                  //También se podría extraer el Column para que se el código luciera mas limpio
                  return Column(
                    children: [
                
                      //Aparezcan los puntos arriba 
                      if(dotsTop!)  
                          _Dots(slides.length),//,colorPrimario!,colorSecundario!),
                      
                      Expanded(
                        child: _Slides(slides: this.slides,)
                        ),
                
                      //Aparezcan los puntos abajo
                      if(!dotsTop!)  
                          _Dots(slides.length),//,colorPrimario!,colorSecundario!),
                
                    ],
                  );
                },
              ),
            ),
        ),
      );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides({Key? key, required this.slides}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
        //actualziar el provider, slider model

        Provider.of<_SliderShowMoidel>(context, listen: false).setCurrentPage = pageController.page!;
    });

  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10),
      child: PageView(
        controller: pageController,
        // children: const [
        //   _Slide(svg:'assets/svgs/slider-1.svg'),
        //   _Slide(svg:'assets/svgs/slider-2.svg'),
        //   _Slide(svg:'assets/svgs/slider-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide: slide,)).toList(),


      ),
    );
    
  }
}

class _Slide extends StatelessWidget {

  //final String svg;
 final Widget slide;

  const _Slide({
    Key? key, 
     //required this.svg,
     required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      //child: SvgPicture.asset(svg)
      child: slide
   );
  }
}

class _Dots extends StatelessWidget {

  final int totalDots;

  // final Color colorPrimario; //El activo
  // final Color colorSecundario; //inactivo


  const _Dots(this.totalDots,);// this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      //color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: List.generate(totalDots, (index) => 
          //Se comenta porque se cambia para que funcionen con provider
          // _Dot(index: index, colorPrimario: this.colorPrimario, colorSecundario: this.colorSecundario,)
             _Dot(index: index,)
        
        ) 
        // const [
        //   _Dot(index: 0),
        //   _Dot(index: 1),
        //   _Dot(index: 2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  
  //Se comenta porque se cambia para que funcionen con provider
  //final Color colorPrimario; //El activo
  //final Color colorSecundario; //inactivo

  const _Dot({
    Key? key,   
    required this.index, 
    //required this.colorPrimario, 
    //required this.colorSecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Cada vez que se dispara el notifyListeners(), se refresca este valor, porl que
    //vuelve a dibujar widget.  
    final currentPage = Provider.of<_SliderShowMoidel>(context);//.getCurrentPage;

    //La mejor opción, optimizando 
    double tamano;
    Color color;

    if(currentPage.getCurrentPage >= index-0.5 && currentPage.getCurrentPage<index + 0.5) {
      tamano = currentPage.getBulletPrimario;
      color  = currentPage.getColorPrimario;
    }else{
      tamano = currentPage.getBullerSecundario;
      color  = currentPage.getColorSecundario;
    }


    return AnimatedContainer(
      duration: const Duration( milliseconds:  200),
    
      // width:  12,
      // height: 12,
      /*width: (currentPage.getCurrentPage == index)
              ? currentPage.getBulletPrimario
              : currentPage.getBullerSecundario,

      height: (currentPage.getCurrentPage == index)
              ? currentPage.getBulletPrimario
              : currentPage.getBullerSecundario,
      */

      width:  tamano,
      height: tamano,

      margin: const EdgeInsets.symmetric(horizontal: 5),
      //color: Colors.red, // No puede usarse al mismo tiempo que decoration
      decoration: BoxDecoration(
        color: color,
        /*
          (currentPage.getCurrentPage >= index-0.5 && currentPage.getCurrentPage<index + 0.5)//(index == currentPage)
        
               ? currentPage.getColorPrimario//colorPrimario//Colors.purple
               : currentPage.getColorSecundario,//colorSecundario,//Colors.grey,
        */
        shape: BoxShape.circle //bordes redondos
      ), 
    );
  }
}


//Se agrega como privada para no tener como dependencia el slider_model,dart

class _SliderShowMoidel extends ChangeNotifier{

  double _currentPage      = 0;
  Color  _colorPrimario    = Colors.purple;
  Color  _colorSecundario  = Colors.grey; 
  double _bulletPrimario   = 12;
  double _bullerSecundario = 12;

  double get getCurrentPage => this._currentPage;

  set setCurrentPage(double value) {
    this._currentPage = value;
      notifyListeners();
  } 

  Color get getColorPrimario => this._colorPrimario;

  set setColorPrimario( Color value) {
  
    this._colorPrimario = value;
    //notifyListeners();
  
  }
  
  Color get getColorSecundario => this._colorSecundario;

  set setColorSecundario(Color value){
    
    this._colorSecundario = value;
    //notifyListeners();
  }

  double get getBulletPrimario => this._bulletPrimario;

  set setBulletPrimario( double bulletPrimario) {
    
    this._bulletPrimario = bulletPrimario;
    //notifyListeners();  
  }

  double get getBullerSecundario => this._bullerSecundario;

  set setBullerSecundario( double bullerSecundario){
  
    this._bullerSecundario = bullerSecundario;
    //notifyListeners();
  }
  
}