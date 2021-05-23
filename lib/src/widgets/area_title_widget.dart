import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AreaTitleWidget extends StatelessWidget {

  final String title;
  final bool usePadding;
  final ThemeProvider themeProvider;

  const AreaTitleWidget({
    Key key,
    @required this.title,
    this.usePadding = false,
    @required this.themeProvider,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: usePadding ? EdgeInsets.only(top: 12) : EdgeInsets.zero,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 26,
          color: themeProvider.darkTheme ? kDMTitleTextColor : kTitleTextColor,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}