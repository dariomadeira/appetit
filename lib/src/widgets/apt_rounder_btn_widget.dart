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
  }) :  super(key: key);

  final double btnSize;
  final IconData icon;
  final Function accion;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: btnSize,
      height: btnSize,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: (backgroundColor!=null) ? backgroundColor : (_themeProvider.darkTheme ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.04)),
          shape: CircleBorder(),
          primary: (backgroundColor!=null) ? Colors.white : (_themeProvider.darkTheme ? Colors.white : Colors.black),
        ),
        child: Icon(
          icon,
          color: (backgroundColor!=null) ? Colors.white : (_themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor),
        ),
        onPressed: accion,
      ),
    );
  }
}