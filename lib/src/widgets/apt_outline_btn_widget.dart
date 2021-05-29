import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AptOutlineBtnWidget extends StatelessWidget {

  final String btnText;
  final Function accion;

  const AptOutlineBtnWidget({
    Key key, 
    @required this.btnText,
    @required this.accion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom( 
        shape: StadiumBorder(),
        side: BorderSide(
          width: 2,
          color: kGBtnBorder,
        ),
        primary: _themeProvider.darkTheme ? Colors.white : Colors.black,
      ),
      onPressed: accion,
      child: Text(
        btnText,
        style: TextStyle(
          color: _themeProvider.darkTheme ? kDMTextColor :  kLMTextColor,
        ),
      ),
    );
  }
}