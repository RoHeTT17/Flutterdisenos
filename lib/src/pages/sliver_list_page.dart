import 'package:disenos/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {
 
  const SliverListPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListOpciones()
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          ),
        ],
      ),
   );
  }
}


class _MainScroll extends StatelessWidget {

 //Se se pusieron aquí para ponerlos en el delegate
   final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {

    final appTeheme = Provider.of<ThemeChanger>(context).getCurrentTheme;
    
    return CustomScrollView(
      slivers: [
              
              // SliverAppBar(
              //   floating: true, //Aparezque en cuando se hace scroll hacia arriba
              //   elevation: 0,
              //   backgroundColor: Colors.red,
              //   title: Text("Holis"),
              // ),

              SliverPersistentHeader(
                floating: true,
                delegate: _SliverCustomDelegate(
                  minHeight: 170,
                  maxHeight: 200,
                  child: Container( //Se envuelve en un contariner para que no se encime en las opciones
                    alignment: Alignment.centerLeft,
                    color: appTeheme.scaffoldBackgroundColor, //Colors.white, 
                    child: const _Titulo()
                  )
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate([
                  ...items, //Operador express para extraer cada item de la lista
                  const SizedBox(height: 100,)
                ]),
             ),

      ],
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
      final size = MediaQuery.of(context).size;
      final appTheme = Provider.of<ThemeChanger>(context);

      return ButtonTheme(
        minWidth: size.width * 0.9,
        
        child: ElevatedButton(
          onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            primary: (appTheme.getDarkTheme) 
               ? appTheme.getCurrentTheme.colorScheme.secondary
               : Color(0xffED6762),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10)))
          ),
          
          
          /*ButtonStyle(
            backgroundColor:MaterialStateProperty.all<Color>(Color(0xffED6762)),
            shape: MaterialStateProperty.all( const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
            ))*/
          child: Container(
            height: 100,
            child:  Center(
              child: Text(
                'CREATE NEW LIST',
                style: TextStyle(
                  color: appTheme.getCurrentTheme.scaffoldBackgroundColor,//Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3
                ),
              ),
            ),
          ),
        )
      );
  }
}

class _SliverCustomDelegate extends SliverPersistentHeaderDelegate{
  
    //Se definen estas propiedad para poder reutilizar la clase.
    final double minHeight;
    final double maxHeight;
    final Widget child;

    _SliverCustomDelegate({required this.minHeight, required this.maxHeight, required this.child}); // El widget que vamos a implementar dentro de esta clase

    //Se crea esa clase para poder definir la propiedad delegate de SliverPersistentHeader
    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      //El SizedBox.expand para que tomo todo el espacio, y su child es el widget que recibimos
      return SizedBox.expand(child: child,);
    }

    @override
    // Tamaño máximo que se puede extender
    double get maxExtent => maxHeight;

    @override
    double get minExtent => minHeight;

    @override
    bool shouldRebuild(covariant _SliverCustomDelegate oldDelegate) {
      //Se debe redibujar. (Se esta recibiendo el _SliverCustomDelegate que es el nombre de la clase).
      //Esta condición se pone por "default". Fernando indica que siempre es la que pone.
      return maxHeight != oldDelegate.maxHeight ||
             minHeight != oldDelegate.minHeight ||
             child     != oldDelegate.child;


  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTeheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(height: 30,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child:  Text(
                             "New", 
                             style: TextStyle(
                                             color: (appTeheme.getDarkTheme) ? Colors.grey: Color(0xff532128,), 
                                             fontSize: 50
                                             ),),
        ),

        Stack(
          children: [
            const SizedBox( width: 100,) ,
            Positioned(
              bottom: 8,
              child: Container(
                width: 160,
                height: 8,
                color: (appTeheme.getDarkTheme) ? Colors.grey: Color(0xffF7CDD5,),  //const Color(0xffF7CDD5),
              ),
            ),

            Container(
              child: const Text('List', style: TextStyle( color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold),),
            ),

          ],
        )
      ],
    );
  }

}

class _ListOpciones extends StatelessWidget {
 
   final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  _ListOpciones({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>  items[index]); //_ListItem(),

  }
}

class _ListItem extends StatelessWidget {
  
  final String titulo;
  final Color  color;
  
  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {

     final appTeheme = Provider.of<ThemeChanger>(context);

    return Container(
       height: 130,
       padding: const EdgeInsets.all(30),
       margin:  const EdgeInsets.all(10),
       decoration: BoxDecoration(
         color: (appTeheme.getDarkTheme) ? Colors.grey:  color,
         borderRadius: BorderRadius.circular(30)
       ),
       child: Text(
                   titulo, 
                   style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 20
                                   ),),
       alignment: Alignment.centerLeft,
    );
  }
}