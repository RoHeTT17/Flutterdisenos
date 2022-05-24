import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/headers.dart';


class HeaderPage extends StatelessWidget {
 
  const HeaderPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeaderWaveGradiant(),
   );
  }
}