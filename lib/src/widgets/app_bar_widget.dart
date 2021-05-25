import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/widgets/app_avatar_widget.dart';
import 'package:appetit/src/widgets/apt_rounder_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  final bool showAppBar;
  final bool showAvatar;
  final bool showBack;
  final bool showLogo;
  final bool showSearch;
  final Function accionSearch;

  const AppBarWidget({
    Key key,
    this.showAppBar = true,
    this.showAvatar = true,
    this.showBack = false,
    this.showLogo = true,
    this.showSearch = false,
    this.accionSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      top: true,
      left: false,
      right: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 8,
        ),
        child: Container(
          height: 64,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: _themeProvider.darkTheme ? Colors.grey[800] : Colors.black26.withOpacity(0.18),
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding + 20),
            color: _themeProvider.darkTheme ? kDMBackgroundPrimary : Colors.white, 
            boxShadow: [
              BoxShadow(
                color: _themeProvider.darkTheme ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.2), 
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Row(
            children: [
              const SizedBox( width: 8),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: showBack,
                        child: AptRounderBtnWidget(
                          accion: () {
                            Navigator.pop(context);
                          },
                          btnSize: 40,
                          icon: Icons.arrow_back,
                        ),
                      ),
                      Visibility(
                        visible: showSearch,
                        child: AptRounderBtnWidget(
                          accion: accionSearch,
                          btnSize: 40,
                          icon: Icons.search,
                        ),
                      ),
                    ],
                  ),
                )
              ),
              showLogo ? SvgPicture.asset(
                'assets/svgs/logo.svg',
                semanticsLabel: 'Appetit',
                width: 100,
              ) : null,
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // AptRounderBtnWidget(
                      //   accion: () {
                      //     Navigator.pop(context);
                      //   },
                      //   btnSize: 40,
                      //   icon: Icons.arrow_back,
                      // ),
                      Visibility(
                        visible: showAvatar,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'profile');
                          },
                          child: AppAvatarWidget(
                            //TODO traer los datos adecuados del logueo
                            avatarImage: "",
                            inicials: "DM",
                            animateShowAvatar: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox( width: 8),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(kToolbarHeight + 8);
  }
}