import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/widgets/app_avatar_widget.dart';
import 'package:appetit/src/widgets/apt_rounder_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class BackgroundWidget extends StatelessWidget {

  final Widget pageBody;
  final bool showAppBar;
  final bool showAvatar;
  final bool showBack;
  final bool showLogo;
  final FloatingActionButton floatBtn;
  final Color backgroundColor;

  const BackgroundWidget({
    Key key,
    @required this.pageBody,
    this.showAppBar = true,
    this.showAvatar = true,
    this.floatBtn, 
    this.showBack = false,
    this.showLogo = true,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
      body: pageBody,
      appBar: this.showAppBar ? AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: showBack ? AptRounderBtnWidget(
                  accion: () {
                    Navigator.pop(context);
                  },
                  btnSize: 40,
                  icon: Icons.arrow_back,
                ) : null,
              ),
            ),
            Center(
              child: showLogo ? SvgPicture.asset(
                'assets/svgs/logo.svg',
                semanticsLabel: 'Appetit',
                width: 120,
              ) : null,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: showAvatar ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'profile');
                  },
                  child: AppAvatarWidget(
                    //TODO traer los datos adecuados del logueo
                    avatarImage: "",
                    inicials: "DM",
                    animateShowAvatar: true,
                  ),
                ) : null
              ),
            ),
          ],
        ),
      ) : null,
      floatingActionButton: floatBtn,
    );
  }
}