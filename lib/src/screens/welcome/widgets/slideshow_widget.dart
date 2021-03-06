import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// modelo de datos privado para el provider
class _SliderModel with ChangeNotifier {
  // declaraciones
  double _currentPage = 0;
  Color _colorPrimario = Colors.grey;
  Color _colorSecundario = Colors.blue;
  int _dotSizeSelect = 16;
  int _dotSizeNormal = 12;
  List<String> _titles;
  List<String> _descriptions;
  int _slidersCount;
  // setters y getters
  double get currentPage {
    return this._currentPage;
  }
  set currentPage (double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
  Color get colorPrimario => this._colorPrimario;
  set colorPrimario (Color colorPrimario) {
    this._colorPrimario = colorPrimario;
  }
  Color get colorSecundario => this._colorSecundario;
  set colorSecundario (Color colorSecundario) {
    this._colorSecundario = colorSecundario;
  }
  int get dotSizeSelect => this._dotSizeSelect;
  set dotSizeSelect (int dotSizeSelect) {
    this._dotSizeSelect = dotSizeSelect;
  }
  int get dotSizeNormal => this._dotSizeNormal;
  set dotSizeNormal (int dotSizeNormal) {
    this._dotSizeNormal = dotSizeNormal;
  }
  List get titles {
    return this._titles;
  }
  set titles (List<String> titles) {
    this._titles = titles;
    this._slidersCount = titles.length;
  }
  List get descriptions {
    return this._descriptions;
  }
  set descriptions (List<String> descriptions) {
    this._descriptions = descriptions;
  }
  int get slidersCount => this._slidersCount;
}

// clase principal
class Slideshow extends StatelessWidget {
  // constructor
  final List<Widget> slides;
  final bool dotsTop;
  final Color dotsColor;
  final Color dotColorSelect;
  final int dotSizeSelect;
  final int dotSizeNormal;
  final List<String> titles;
  final List<String> descriptions;
  final Function finalsliderbutton;
  Slideshow({
    @required this.slides, 
    this.dotsTop = false, 
    this.dotsColor, 
    this.dotColorSelect,
    this.dotSizeSelect,
    this.dotSizeNormal,
    @required this.titles,
    @required this.descriptions,
    @required this.finalsliderbutton,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: Center(
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SliderModel>(context).colorPrimario = this.dotColorSelect;
            Provider.of<_SliderModel>(context).colorSecundario = this.dotsColor;
            Provider.of<_SliderModel>(context).dotSizeSelect = this.dotSizeSelect;
            Provider.of<_SliderModel>(context).dotSizeNormal = this.dotSizeNormal;
            Provider.of<_SliderModel>(context).titles = this.titles;
            Provider.of<_SliderModel>(context).descriptions = this.descriptions;
            return _CreateEstructure(dotsTop: dotsTop, slides: slides, finalsliderbutton: this.finalsliderbutton);
          }
        ),
      ),
    );
  }
}

// estructura del slider
class _CreateEstructure extends StatelessWidget {
  // contructor
  final bool dotsTop;
  final List<Widget> slides;
  final Function finalsliderbutton;
  const _CreateEstructure({
    @required this.dotsTop,
    @required this.slides,
    this.finalsliderbutton,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.dotsTop) _Dots(this.slides.length),
        Expanded(
          child: _Slides(this.slides, this.finalsliderbutton)
        ),
        if (!this.dotsTop) _Dots(this.slides.length),
      ],
    );
  }
}

// creador de todos los puntos
class _Dots extends StatelessWidget {
  // constructor
  final int slidesCount;
  const _Dots(
    this.slidesCount,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.slidesCount, (index) => _Dot(index)),
      ),
    );
  }
}

// creador de un punto
class _Dot extends StatelessWidget {
  // contructor
  final int index;
  const _Dot(
    this.index,
  );
  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SliderModel>(context);
    double finalSize = 0.0;
    Color finalDotColor;
    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      finalSize = ssModel._dotSizeSelect.toDouble();
      finalDotColor = ssModel._colorPrimario;
    } else {
      finalSize = ssModel._dotSizeNormal.toDouble();
      finalDotColor = ssModel._colorSecundario;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: finalSize,
      height: finalSize,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: finalDotColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

// creador de los sliders (stateful)
class _Slides extends StatefulWidget {
  // contructor
  final List<Widget> slides;
  final finalsliderbutton;
  const _Slides(
    this.slides,
    this.finalsliderbutton,
  );
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
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
        physics: BouncingScrollPhysics(),
        controller: pageViewController,
        children: widget.slides.map((element) {
          final int index = widget.slides.indexOf(element);
          final String theTitle = Provider.of<_SliderModel>(context, listen: false).titles[index];
          final String theDescription = Provider.of<_SliderModel>(context, listen: false).descriptions[index];
          return _Slide(element, theTitle, theDescription, index, widget.finalsliderbutton);
        }).toList(),
      ),
    );
  }
}

// clase del slide
class _Slide extends StatelessWidget {
  final Widget slide;
  final String title;
  final String description;
  final int theSlider;
  final finalsliderbutton;
  const _Slide(
    this.slide,
    this.title,
    this.description,
    this.theSlider,
    this.finalsliderbutton,
  );
  @override
  Widget build(BuildContext context) {
    final totalSliders = Provider.of<_SliderModel>(context).slidersCount - 1;
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: slide,
            ),
          ),
          Text(
            this.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            this.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (totalSliders == theSlider) Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 80,
            child: Center(
              child: MaterialButton(
                focusElevation: 0,
                hoverElevation: 0,
                elevation: 0,
                onPressed: this.finalsliderbutton,
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              )
            ),
          ),
        ],
      ),
    );
  }
}