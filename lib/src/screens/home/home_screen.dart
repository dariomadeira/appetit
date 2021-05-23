import 'package:appetit/src/customs/appetit_icons.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/bottom_navigation_provider.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabsProvider = Provider.of<TabsNavigationProvider>(context);
    return Scaffold(
      body: SafeArea(top: false, left: false, right: false, bottom: true, child: tabsProvider.callScreen(tabsProvider.currentIndex)),
      bottomNavigationBar: _createBottomNavigation(context, tabsProvider),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        highlightElevation: 0,
        focusElevation: 0,
        onPressed: () {
          tabsProvider.changeBottomBarIndex(2);
        },
        child: Icon(Appetit.shopping_basket, color: Colors.white),
        elevation: 0,
      ),
    );
  }

  Widget _createBottomNavigation(BuildContext context, TabsNavigationProvider tabsProvider) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    Color _calculateColorNoSelected(int index) {
      Color result;
      if (_themeProvider.darkTheme) {
        if (index == 2) {
          result = kDMBottomNabBarIconUnselectColor;
        } else {
          result = kPrimaryColor;
        }
      } else {
        if (index == 2) {
          result = kBottomGrayColor;
        } else {
          result = kPrimaryColor;
        }
      }
      return result;
    }

    return SizedBox(
      height: 68,
      child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: _themeProvider.darkTheme ? kDMBottomNabBar : kLMBottomNabBar,
          currentIndex: tabsProvider.currentIndex == 2 ? 0 : tabsProvider.currentIndex,
          onTap: (index) {
            tabsProvider.changeBottomBarIndex(index);
          },
          unselectedItemColor: _themeProvider.darkTheme ? kDMBottomNabBarIconUnselectColor : kBottomGrayColor,
          selectedItemColor: _calculateColorNoSelected(tabsProvider.currentIndex),
          selectedLabelStyle: tabsProvider.currentIndex == 2 ? TextStyle(fontWeight: FontWeight.w500, fontSize: 15) : TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                child: Icon(Appetit.compass),
              ),
              label: AppLocalizations.of(context).translate("bottom.nav.explorer"),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                child: Icon(Appetit.heart_outline),
              ),
              label: AppLocalizations.of(context).translate("bottom.nav.favorites"),
            ),
          ]),
    );
  }
}