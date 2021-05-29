import 'package:appetit/constants.dart';
import 'package:appetit/src/customs/appetit_icons.dart';
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
  final bool showCartEmpty;
  final Function accionSearch;
  final Function accionCartEmpty;
  final String cartPrice;

  const AppBarWidget({
    Key key,
    this.showAppBar = true,
    this.showAvatar = true,
    this.showBack = false,
    this.showLogo = true,
    this.showSearch = false,
    this.accionSearch,
    this.showCartEmpty = false,
    this.accionCartEmpty,
    this.cartPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      top: true,
      left: false,
      right: false,
      bottom: false,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        color: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
        child: Row(
          children: [
            const SizedBox(width: kDefaultPadding),
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
                    Visibility(
                      visible: showCartEmpty,
                      child: AptRounderBtnWidget(
                        accion: accionCartEmpty,
                        btnSize: 40,
                        icon: Appetit.vaciar,
                      ),
                    ),
                  ],
                ),
              )
            ),
            Visibility(
              visible: showLogo,
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
                semanticsLabel: 'Appetit',
                width: 100,
              ),
            ),
            if (cartPrice != null) Text(
              cartPrice,
              style: TextStyle(
                fontSize: 24,
                color: kPriceColor,
                fontWeight: FontWeight.w900,
              ),
            ),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox( width: kDefaultPadding),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(kToolbarHeight + 8);
  }
}