
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinteresButtom{

  final Function() onPress; //Si solo se pone Function marca error porque no es compatible en el GestureDetector
  final IconData icon;

  PinteresButtom({ required this.onPress,required  this.icon});

}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinteresButtom> items;

  /*final List<PinteresButtom> items = [
        PinteresButtom(onPress: (){ print( 'icono 1' ); }, icon: Icons.pie_chart),
        PinteresButtom(onPress: (){ print( 'icono 2'); },  icon: Icons.search),
        PinteresButtom(onPress: (){ print( 'icono 3'); },  icon: Icons.notifications),
        PinteresButtom(onPress: (){ print( 'icono 4'); },  icon: Icons.supervised_user_circle)
  ];*/

  PinterestMenu({
    this.mostrar         = true, 
    this.backgroundColor = Colors.white,  
    this.activeColor     = Colors.purple, 
    this.inactiveColor   = Colors.grey, 
    required this.items
  });

  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
       create: (BuildContext context) { return new _MenuModel(); }, //=>new _MenuModel()
       child: AnimatedOpacity(
                    opacity:  (mostrar) ? 1 : 0, // 1 es totalmente visible
                    duration: const Duration(milliseconds: 250),
                    child:   Builder(builder: (BuildContext context) { 
                              
                              final properties = Provider.of<_MenuModel>(context);

                              properties.setBackgroundColor = this.backgroundColor;
                              properties.setActiveColor     = this.activeColor;
                              properties.setInactiveColor   = this.inactiveColor;

                             return  _ContainerFormat(
                                        buttom: _MenuItems(menuItems: items),
                                    );
                    },)
                  ),
     );
  }
}

class _ContainerFormat extends StatelessWidget {
  
  final Widget buttom;
  
  const _ContainerFormat({
    Key? key, 
    required this.buttom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final properties = Provider.of<_MenuModel>(context);
  
    return Container(
        child: buttom,
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: properties.getBackgroundColor,//Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          boxShadow: const[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5
            )
          ]
        ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinteresButtom> menuItems;

  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _ButtomMenu(index: index, item: menuItems[index]))
    );
  }
}

class _ButtomMenu extends StatelessWidget {
  
  final int index;
  final PinteresButtom item;
  
  const _ButtomMenu({Key? key, required this.index, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).getItemSeleccionado;

    final properties = Provider.of<_MenuModel>(context);

    return GestureDetector(
      /*
      Se debe tener mucho cuidado cuando se ponen () y cuando no. Si se pone () le estamos indicando que se
      debe ejecutar la función en ese momento, por eso se cambio de item.onPress a item.OnPress().
      */
      onTap: /*item.onPress,*/ (){
          // en los listener la propiedad listen debe ser false
          Provider.of<_MenuModel>(context,listen: false).setItemSeleccionado = index;
          item.onPress(); // Si solo se pone item.Onpress no dispara el listener
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index)
                ? 35
                : 25,
          color: (itemSeleccionado == index)
                ? properties.getActiveColor//Colors.purple
                : properties.getInactiveColor,//Colors.blueGrey,
          ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

  int   _itemSeleccionado  = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor     = Colors.purple;
  Color _inactiveColor   = Colors.grey;

  Color get getBackgroundColor => this._backgroundColor;

  set setBackgroundColor(Color value){
     this._backgroundColor = value;
     //notifyListeners();
  }

  Color get getActiveColor => this._activeColor;

  set setActiveColor(Color value){ 
    this._activeColor = value;
    //notifyListeners();
  }

  Color get getInactiveColor => this._inactiveColor;

  set setInactiveColor(Color value){ 
    this._inactiveColor = value;
    //notifyListeners();
  }

  int get getItemSeleccionado => this._itemSeleccionado;

  set setItemSeleccionado(int value){
    this._itemSeleccionado = value;
    notifyListeners();
  } 

}