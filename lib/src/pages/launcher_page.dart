import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/routes/routes.dart';
import 'package:disenos/src/theme/theme.dart';

class LauncherPage extends StatelessWidget {
 
  const LauncherPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter'),
      ),
      body: _ListaMenu(),
      drawer: _MenuPrincipal(), //Menú la teral
    );
  }
}

class _ListaMenu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

      final appTheme = Provider.of<ThemeChanger>(context).getCurrentTheme;

      return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: pageRoutes.length,
        itemBuilder: (context, i) => ListTile(
          leading:  FaIcon(pageRoutes[i].icon, color: appTheme.colorScheme.secondary,), 
          title:    Text (pageRoutes[i].titulo),
          trailing: Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary,),
          onTap: (){
              //Navigator.push(context, pageRoutes[i].page);
              Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
          },
        ), 
        separatorBuilder: (context, i) => Divider(
          color: appTheme.primaryColor  //Colors.blue,
        ), 

    );

  }
}


class _MenuPrincipal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);  
    final colorSecundary = appTheme.getCurrentTheme.colorScheme.secondary;

    return Drawer(
      child: Container(
        child: Column(
          children: [

            SafeArea(
              child: Container(
                //padding: const EdgeInsets.only(),//all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: colorSecundary,//Colors.blue,
                  child: const Text('RH',style: TextStyle(fontSize: 50),),
                )
              ),
            ), 
    
            Expanded(child: _ListaMenu()),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: colorSecundary/*Colors.blue*/,),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: colorSecundary, //Colors.blue,
                value: appTheme.getDarkTheme,
                onChanged: (value){

                    appTheme.setDarkTheme = value;

                }
              ),
            ),
            
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: colorSecundary/*Colors.blue*/,),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: colorSecundary,//Colors.blue,
                  value: appTheme.getCustomTheme,
                  onChanged: (value) => appTheme.setCustomTheme = value,
                ),
              ),
            )
          ],
        ),
      ),
    );    
  }
}