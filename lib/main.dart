import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos/src/pages/launcher_page.dart';
import 'package:disenos/src/theme/theme.dart';

void main() => runApp(
  ChangeNotifierProvider(
  create: ((_) => new ThemeChanger(2)),
  child: MyApp())
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).getCurrentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Diseños App',
      home:  const LauncherPage(),
   );
  }
}