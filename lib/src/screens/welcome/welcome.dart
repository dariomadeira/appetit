import 'package:appetit/constants.dart';
import 'package:appetit/src/helpers/image_helpers.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/preferences/preferences.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/screens/welcome/widgets/slideshow_widget.dart';
import 'package:appetit/src/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      showAppBar: false,
      pageBody: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: SvgPicture.asset("assets/svgs/logo.svg"),
            ),
            Expanded(
              child: Container(
                child: _WelcomeSlider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new AppPreferences();
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return FutureBuilder(
      future: Future.wait([
        loadSvg(context, "assets/svgs/1.svg"),
        loadSvg(context, "assets/svgs/2.svg"),
        loadSvg(context, "assets/svgs/3.svg"),
      ]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) { 
          return  Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    kPrimaryColor,
                  ),
              ),
            ),
          );
        }
        return Slideshow(
          dotColorSelect: kPrimaryColor,
          dotsColor: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
          dotSizeSelect: 14,
          dotSizeNormal: 10,
          dotsTop: false,
          slides: <Widget>[
            SvgPicture.asset("assets/svgs/1.svg"),
            SvgPicture.asset("assets/svgs/2.svg"),
            SvgPicture.asset("assets/svgs/3.svg"),
          ],
          titles: <String>[
            AppLocalizations.of(context).translate("welcome.slider1.title"),
            AppLocalizations.of(context).translate("welcome.slider2.title"),
            AppLocalizations.of(context).translate("welcome.slider3.title"),
          ],
          descriptions: <String>[
            AppLocalizations.of(context).translate("welcome.slider1.description"),
            AppLocalizations.of(context).translate("welcome.slider2.description"),
            AppLocalizations.of(context).translate("welcome.slider3.description"),
          ],
          finalsliderbutton: () {
            prefs.savePreferenceBool("welcome", true);
            Navigator.pushReplacementNamed(context, 'home');
          }
        );
      },
    );
  }
}