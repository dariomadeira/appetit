import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class AreaTitleWidget extends StatelessWidget {

  final String title;
  final bool usePadding;

  const AreaTitleWidget({
    Key key,
    @required this.title,
    this.usePadding = false,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: usePadding ? EdgeInsets.only(top: 12) : EdgeInsets.zero,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 26,
          color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}