import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class PinterestPage extends StatelessWidget {
 
  const PinterestPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
 
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),  
      child: Scaffold(
        
        //body: PinterestMenu(),
        //body: PinterestGrid(),
    
        body: Stack(
          children: [
            PinterestGrid(),
            const _UbicacionMenu(),
          ],
        ),
    
       ),
    );
  }
}

class _UbicacionMenu extends StatelessWidget {
  
  const _UbicacionMenu({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   final mostrarBotones = Provider.of<_MenuModel>(context).getMostrar;

   final withPatalla = MediaQuery.of(context).size.width;

    return Positioned(
      child: Container(
              child: Align(
                     child: PinterestMenu(
                       mostrar: mostrarBotones,
                       items: [
                                //No se importa la clase PinteresButtom, porque ya esta implicia en al importación de
                                //pinterest_menu.dart
                                PinteresButtom(onPress: (){ print( 'icono 1' ); }, icon: Icons.pie_chart),
                                PinteresButtom(onPress: (){ print( 'icono 2'); },  icon: Icons.search),
                                PinteresButtom(onPress: (){ print( 'icono 3'); },  icon: Icons.notifications),
                                PinteresButtom(onPress: (){ print( 'icono 4'); },  icon: Icons.supervised_user_circle)
                       ],
                       ),
              ),
              width: withPatalla,  
      ),
      bottom: 30,
      );
  }
}

class PinterestGrid extends StatefulWidget {

  PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  List<int> items = List.generate(200, (index) => index);
  ScrollController scrollController = new ScrollController();
  double scrollValAnt = 0; //0 es la poción inicial (hasta arriba)

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
          print("${scrollController.offset}");

         if (scrollController.offset > scrollValAnt && scrollController.offset > 150){
             Provider.of<_MenuModel>(context, listen: false).setMostrar = false;
         } else{
           //Motrar menú
             Provider.of<_MenuModel>(context, listen: false).setMostrar = true;
         } 

         scrollValAnt = scrollController.offset;

    });
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
                  controller: scrollController,
                  gridDelegate:  SliverWovenGridDelegate.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        pattern: const [
                          WovenGridTile(1),
                          WovenGridTile(
                            5 / 7,
                            crossAxisRatio: 0.9,
                            alignment: AlignmentDirectional.centerEnd,
                          ),
                        ],
                      ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    
                    (context, index) => _PinterestItenm(index: index),//Text('$index'),
                    childCount: items.length
                    
                  ),
          );
    
    /*MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            //margin: EdgeInsets.all(8),
            height: index % 2 == 0 ? 300 : 180,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: CircleAvatar(
                    backgroundColor: Colors.white, child: Text('$index'))),
          ),
        );
      },
    );*/
  }
}

class _PinterestItenm extends StatelessWidget {

  final int index;

  const _PinterestItenm({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('$index'),
                ),
              ),
            );
  }
}

class _MenuModel with ChangeNotifier{

    bool _mostrar = true;

    set setMostrar (bool mostrar) {
      this._mostrar = mostrar;
      notifyListeners();
    }

    bool get getMostrar{
        return this._mostrar;
    }


}