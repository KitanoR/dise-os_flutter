import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  SlideShow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _SliderModel(),
        child: SafeArea(
                child: Center(
                  child: Builder(
                    builder: (BuildContext context) {
                      Provider.of<_SliderModel>(context).colorPrimario = this.colorPrimario;
                      Provider.of<_SliderModel>(context).colorSecundario = this.colorSecundario;
                      Provider.of<_SliderModel>(context).bulletPrimario = this.bulletPrimario;
                      Provider.of<_SliderModel>(context).bulletSecundario = this.bulletSecundario;
                      return _CrearEstructuraSlideShow(
                          puntosArriba: puntosArriba, 
                          slides: slides
                        );
                    },
                  )
              ),
        ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if(this.puntosArriba)  
          _Dots(this.slides.length),
        Expanded(
          child: _Slides(this.slides),
        ),
        if(!this.puntosArriba)  
          _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int cantidad;

  _Dots(this.cantidad);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(cantidad, (index) => _Dot(index))
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index) ;

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SliderModel>(context);
    double tamanio = ssModel.bulletSecundario;
    Color color = ssModel.colorSecundario;
    if(ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5){
      tamanio = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: tamanio,
      height: tamanio,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
    );
  }
}
// SvgPicture.asset('assets/svg/slide-2.svg')
class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides(this.slides);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      print('pagia ${pageViewController.page}');
      // actualizar el provider, SlideModel
      Provider.of<_SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
    super.initState();
  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide)=> _Slide(slide)).toList(),
        
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}


class _SliderModel with ChangeNotifier {

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12.0;
  double _bulletSecundario = 12.0;


  double get currentPage => this._currentPage;
  
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color){
    this._colorPrimario = color;
  }


  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color color){
    this._colorSecundario = color;
  }
  // Tamanio de bullets
  
  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bullet){
    this._bulletPrimario = bullet;
  }
  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bullet){
    this._bulletSecundario = bullet;
  }

}