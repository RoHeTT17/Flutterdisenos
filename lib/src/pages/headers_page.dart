import 'package:disenos/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/headers.dart';
import 'package:provider/provider.dart';


class HeaderPage extends StatelessWidget {
 
  const HeaderPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {

    final colorSecundary = Provider.of<ThemeChanger>(context).getCurrentTheme.colorScheme.secondary;

    return  Scaffold(
      body: HeaderWave(color:colorSecundary), 
        //HeaderWaveGradiant(),
   );
  }
}