import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AptRounderBtnWidget extends StatelessWidget {
  const AptRounderBtnWidget({
    Key key,
    @required this.btnSize,
    @required this.icon,
    @required this.accion,
    this.backgroundColor,
    this.specialState = false,
  }) : super(key: key);

  final double btnSize;
  final IconData icon;
  final Function accion;
  final Color backgroundColor;
  final bool specialState;

  Color _calculateBgColor(ThemeProvider _themeProvider) {
    Color result;
    if (backgroundColor != null) {
      if (specialState) {
        if(_themeProvider.darkTheme) {
          result = backgroundColor;
        } else {
          result = backgroundColor.withOpacity(0.2);
        }
      } else {
        result = backgroundColor;
      }
    } else {
      result = Colors.transparent;
    }
    return result;
  }

  Color _calculateIconColor(ThemeProvider _themeProvider) {
    Color result;
    if (backgroundColor != null) {
      if (specialState) {
        if(_themeProvider.darkTheme) {
          result = Colors.white.withOpacity(0.8);
        } else {
          result = backgroundColor;
        }
      } else {
        result = Colors.white;
      }
    } else {
      if(_themeProvider.darkTheme) {
        result = kDMTitleTextColor;
      } else {
        result = kLMTitleTextColor;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: btnSize,
      height: btnSize,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _calculateBgColor(_themeProvider),
          shape: CircleBorder(),
          primary: (backgroundColor != null) ? Colors.white : (_themeProvider.darkTheme ? Colors.white : Colors.black),
        ),
        child: Icon(
          icon,
          color: _calculateIconColor(_themeProvider),
          size: specialState ? btnSize - 24 : null,
        ),
        onPressed: accion,
      ),
    );
  }
}
