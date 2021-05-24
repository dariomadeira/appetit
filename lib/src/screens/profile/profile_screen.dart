import 'package:appetit/constants.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/screens/profile/widgets/option_tile_widget.dart';
import 'package:appetit/src/widgets/app_avatar_widget.dart';
import 'package:appetit/src/widgets/apt_outline_btn_widget.dart';
import 'package:appetit/src/widgets/apt_rounder_btn_widget.dart';
import 'package:appetit/src/widgets/area_title_widget.dart';
import 'package:appetit/src/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return BackgroundWidget(
      showBack: true,
      showAvatar: false,
      showLogo: false,
      pageBody: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              maxHeight: 230,
              minHeight: 230,
              child: Container(
                color: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
                child: Column(
                  children: [
                    SizedBox(
                      height: 116,
                      width: 116,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          AppAvatarWidget(
                            //TODO traer los datos adecuados del logueo
                            avatarImage: "",
                            inicials: "DM",
                            animateShowAvatar: true,
                            sizeRadius: 116,
                          ),
                          Positioned(
                            right: -12,
                            bottom: 0,
                            child: AptRounderBtnWidget(
                              accion: () {},
                              btnSize: 48,
                              icon: Icons.camera_alt_outlined,
                              backgroundColor: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding/2),
                    Text(
                      //TODO traer los datos adecuados del logueo
                      "Darío Madeira",
                      style: TextStyle(
                        fontSize: 26,
                        color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding/2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AptOutlineBtnWidget(
                          btnText: AppLocalizations.of(context).translate("profile.logout"),
                          themeProvider: _themeProvider,
                          accion: () {},
                        ),
                        const SizedBox( width: kDefaultPadding/2),
                        AptOutlineBtnWidget(
                          btnText: AppLocalizations.of(context).translate("profile.delete.account"),
                          themeProvider: _themeProvider,
                          accion: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(
                  top: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding + 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AreaTitleWidget(
                      title: AppLocalizations.of(context).translate("profile.about.me"),
                      themeProvider: _themeProvider,
                    ),
                    const SizedBox(height: 16),
                    OptionTile(
                      btnTitle: AppLocalizations.of(context).translate("profile.email"),
                      btnSubtitle: "",
                      iconBtn: Icons.email_outlined,
                      iconColor: Color(0xFFF44336),
                    ),
                    OptionTile(
                      btnTitle: AppLocalizations.of(context).translate("profile.phone"),
                      btnSubtitle: "",
                      iconBtn: Icons.phone_android_outlined,
                      iconColor: Color(0xFFFF9800),
                    ),
                    OptionTile(
                      btnTitle: AppLocalizations.of(context).translate("profile.address"),
                      btnSubtitle: "",
                      iconBtn: Icons.place_outlined,
                      iconColor: Color(0xFF3F51B5),
                    ),
                    OptionTile(
                      btnTitle: AppLocalizations.of(context).translate("profile.join.date"),
                      btnSubtitle: "",
                      iconBtn: Icons.calendar_today_outlined,
                      iconColor: Color(0xFF009688),
                    ),
                    AreaTitleWidget(
                      title: AppLocalizations.of(context).translate("profile.config"),
                      themeProvider: _themeProvider,
                    ),
                    const SizedBox(height: 16),
                    _switchDark(context, _themeProvider),
                  ],
                ),
              ),
            ])
          ),
        ],
      ),
    );
  }
}

Widget _switchDark(BuildContext context, ThemeProvider _themeProvider) {
  return Column(
    children: [
      SwitchListTile(
        activeTrackColor: kPrimaryColor.withOpacity(0.2),
        activeColor: kPrimaryColor,
        contentPadding: EdgeInsets.symmetric(horizontal: -20),
        title: OptionTile(
          btnTitle: AppLocalizations.of(context).translate(_themeProvider.darkTheme ? "profile.dark.mode.active" : "profile.dark.mode.deactive"),
          btnSubtitle: AppLocalizations.of(context).translate(_themeProvider.darkTheme ? "profile.dark.mode.light" : "profile.dark.mode.dark"),
          iconBtn: Icons.brightness_2_outlined,
          noBottomSpace: false,
          iconColor: Color(0xFF607D8B),
        ),
        value: _themeProvider.darkTheme,
        onChanged: (value) {
          _themeProvider.darkTheme = value;
        },
      ),
      const SizedBox(height: 16),
    ],
  );
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child
  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }
  @override
  double get maxExtent => maxHeight;
  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight|| minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}