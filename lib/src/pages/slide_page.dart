import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidePage extends StatelessWidget {
 
  const SlidePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        slides: [
         SvgPicture.asset('assets/svgs/slider-1.svg'),
         SvgPicture.asset('assets/svgs/slider-2.svg'),
         SvgPicture.asset('assets/svgs/slider-3.svg'),
         SvgPicture.asset('assets/svgs/slider-4.svg'),
         SvgPicture.asset('assets/svgs/slider-5.svg'),
        ],
        //dotsTop: false,
        //colorPrimario: Colors.red,
        bulletPrimario: 15,
        bullerSecundario: 12,
      ),
   );
  }
}