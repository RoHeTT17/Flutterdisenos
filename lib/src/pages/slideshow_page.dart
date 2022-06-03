import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
 
  const SlideShowPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          children: [
            Expanded(
              child: _Slides()
              ),
            _Dots()
          ],
        ),
     ),
   );
  }
}

class _Slides extends StatelessWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10),
      child: PageView(
        children: const [
          _Slide(svg:'assets/svgs/slider-1.svg'),
          _Slide(svg:'assets/svgs/slider-2.svg'),
          _Slide(svg:'assets/svgs/slider-3.svg'),
        ],
      ),
    );
    
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide({
    Key? key, 
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
   );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      //color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      //color: Colors.red, // No puede usarse al mismo tiempo que decoration
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle //bordes redondos
      ),
    );
  }
}