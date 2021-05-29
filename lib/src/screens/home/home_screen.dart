import 'package:appetit/constants.dart';
import 'package:appetit/src/customs/appetit_icons.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/bottom_navigation_provider.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    final _translate = AppLocalizations.of(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: _bottomNavigationProvider.callScreen(_bottomNavigationProvider.currentIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 74,
        child: BottomNavigationBar(
          backgroundColor:  _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
          fixedColor: kPrimaryColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          elevation: 0,
          currentIndex: _bottomNavigationProvider.currentIndex,
          onTap: (index) {
            _bottomNavigationProvider.changeBottomBarIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                child: Icon(Appetit.explorar),
              ),
              label: _translate.translate("bottom.nav.explorer"),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                child: Icon(Appetit.favoritos),
              ),
              label: _translate.translate("bottom.nav.favorites"),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                child: Icon(Appetit.pedidos),
              ),
              label: _translate.translate("bottom.nav.cart"),
            ),
          ],
        ),
      ),
    );
  }
}
