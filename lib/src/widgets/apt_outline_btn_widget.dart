import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';

class AptOutlineBtnWidget extends StatelessWidget {
  final String btnText;
  final ThemeProvider themeProvider;
  final Function accion;
  const AptOutlineBtnWidget({
    Key key, 
    @required this.btnText,
    @required this.themeProvider,
    @required this.accion,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom( 
        shape: StadiumBorder(),
        side: BorderSide(
          width: 2,
          color: kGBtnBorder,
        ),
        primary: themeProvider.darkTheme ? Colors.white : Colors.black,
      ),
      onPressed: accion,
      child: Text(
        btnText,
        style: TextStyle(
          color: themeProvider.darkTheme ? kDMTextColor :  kLMTextColor,
        ),
      ),
    );
  }
}