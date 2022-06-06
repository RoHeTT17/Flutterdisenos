import 'package:disenos/src/models/slider_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
 
  const SlideShowPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    //Scope del provider
    return ChangeNotifierProvider( 
      create: (context) => SliderMoidel(),//indicar a que clase hace referencia.
      child: Scaffold(
        body: Center(
          child:Column(
            children: const [
              Expanded(
                child: _Slides()
                ),
              _Dots()
            ],
          ),
       ),
       ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
        //actualziar el provider, slider model

        Provider.of<SliderMoidel>(context, listen: false).setCurrentPage = pageController.page!;


    });

  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10),
      child: PageView(
        controller: pageController,
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
        children: const [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final double index;

  const _Dot({
    Key? key, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Cada vez que se dispara el notifyListeners(), se refresca este valor, porl que
    //vuelve a dibujar widget.  
    final currentPage = Provider.of<SliderMoidel>(context).getCurrentPage;

    return AnimatedContainer(
      duration: const Duration( milliseconds:  200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      //color: Colors.red, // No puede usarse al mismo tiempo que decoration
      decoration: BoxDecoration(
        color: (currentPage >= index-0.5 && currentPage<index + 0.5)//(index == currentPage)
               ? Colors.purple
               : Colors.grey,
        shape: BoxShape.circle //bordes redondos
      ), 
    );
  }
}