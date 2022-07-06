import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos/src/pages/launcher_page.dart';
import 'package:disenos/src/pages/launcher_tablet_page.dart';
import 'package:disenos/src/theme/theme.dart';

import 'package:disenos/src/models/layout_model.dart';
void main() => runApp(

  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: (_) =>new LayoutModel())
      //ChangeNotifierProvider<ThemeChanger>(create: (_) =>new ThemeChanger(2) ),
    ],
    child: MyApp()
  )

  /*ChangeNotifierProvider(
  create: ((_) => new ThemeChanger(2)),
  child: MyApp())*/
 
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).getCurrentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Diseños App',
      home:  OrientationBuilder(
        builder: (context, orientation) {

         /* print('Orientation $orientation');

          return Container(
            child: const LauncherPage(),
          );*/

            final screenSize = MediaQuery.of(context).size;

            if (screenSize.width > 500){
                //Si es mayor a 500 pixeles significa es bastante ancha
                 return LauncherTablePage();
            }else{
                return LauncherPage();
            }

        }
      ),
   );
  }
}