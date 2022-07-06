import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/widgets/slideshow.dart';


class SlidePage extends StatelessWidget {
 
  const SlidePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {

    bool isLarge;

    if(MediaQuery.of(context).size.height > 500){
      isLarge = true;
    }else{
      isLarge = false;
    }  

    final children =  [
                        Expanded(child: MiSlideShow()),
                        Expanded(child: MiSlideShow()),
                      ];

    return Scaffold(
      body: (isLarge)
          ? Column(children: children,)
          : Row(children: children,),
   );
  }
}

class MiSlideShow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final colorSecundary = appTheme.getCurrentTheme.colorScheme.secondary;

    return Slideshow(

      slides: [
       SvgPicture.asset('assets/svgs/slider-1.svg'),
       SvgPicture.asset('assets/svgs/slider-2.svg'),
       SvgPicture.asset('assets/svgs/slider-3.svg'),
       SvgPicture.asset('assets/svgs/slider-4.svg'),
       SvgPicture.asset('assets/svgs/slider-5.svg'),
      ],
      //dotsTop: true,

      //colorPrimario: Colors.red,
      //colorSecundario: Colors.amber,
      colorPrimario: (appTheme.getDarkTheme)
        ? colorSecundary
        : Colors.purple,
      bulletPrimario: 15,
      bullerSecundario: 12,
    );
  }
}