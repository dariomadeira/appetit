import 'package:appetit/constants.dart';
import 'package:flutter/material.dart';
import 'apt_rounder_btn_widget.dart';

class AptSettingsBtnWidget extends StatelessWidget {
  final String textBtn;
  final Color btnColor;
  final IconData icon;
  final bool isDark;
  const AptSettingsBtnWidget({
    Key key,
    @required this.textBtn,
    this.btnColor,
    @required this.icon,
    @required this.isDark,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AptRounderBtnWidget(
          accion: () {},
          btnSize: 56,
          icon: icon,
          backgroundColor: btnColor,
          specialState: true,
        ),
        const SizedBox(height: 4),
        Text(
          textBtn,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.1,
            color: isDark ? kDMTextColor : kLMTextColor,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}