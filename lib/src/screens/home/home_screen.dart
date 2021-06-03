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

    final String _badgeCount = "1";

    return Scaffold(
      body: SafeArea(
        child: _bottomNavigationProvider.callScreen(_bottomNavigationProvider.currentIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 74,
        child: BottomNavigationBar(
          backgroundColor:  _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
          fixedColor: kPrimaryColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
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
                width: 32,
                child: Center(
                  child: _bottomNavigationProvider.currentIndex == 0 
                    ? Icon(Appetit.compass)
                    : Icon(Appetit.compass2)
                ),
              ),
              label: _translate.translate("bottom.nav.explorer"),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                width: 32,
                child: Center(
                  child: _bottomNavigationProvider.currentIndex == 1
                    ? Icon(Appetit.tableware2)
                    : Icon(Appetit.tableware)
                ),
              ),
              label: _translate.translate("bottom.nav.news"),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                width: 32,
                child: Center(
                  child: _bottomNavigationProvider.currentIndex == 2
                    ? Icon(Appetit.heart2)
                    : Icon(Appetit.heart)
                ),
              ),
              label: _translate.translate("bottom.nav.favorites"),
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 32,
                width: 64,
                child: Stack(
                  children: [
                    Center(
                      child: _bottomNavigationProvider.currentIndex == 3
                      ? Icon(Appetit.bill2)
                      : Icon(Appetit.bill)
                    ),
                    Container(
                      padding: EdgeInsets.all(_badgeCount.length >= 3 ? 4 :0),
                      decoration: BoxDecoration(
                        color: Colors.amber[900],
                        borderRadius: BorderRadius.circular(kDefaultPadding/2),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _badgeCount,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              label: _translate.translate("bottom.nav.cart"),
            ),
          ],
        ),
      ),
    );
  }
}
