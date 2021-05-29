import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apt_rounder_btn_widget.dart';

class AptSettingsBtnWidget extends StatelessWidget {

  final String textBtn;
  final Color btnColor;
  final IconData icon;

  const AptSettingsBtnWidget({
    Key key,
    @required this.textBtn,
    this.btnColor,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        AptRounderBtnWidget(
          accion: () {},
          btnSize: 48,
          icon: icon,
          backgroundColor: btnColor,
          specialState: true,
        ),
        const SizedBox(height: 4),
        Text(
          textBtn,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            height: 1.1,
            color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}