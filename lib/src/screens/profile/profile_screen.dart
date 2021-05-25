import 'package:appetit/constants.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/screens/profile/widgets/option_tile_widget.dart';
import 'package:appetit/src/widgets/app_avatar_widget.dart';
import 'package:appetit/src/widgets/app_bar_widget.dart';
import 'package:appetit/src/widgets/apt_settings_btn_widget.dart';
import 'package:appetit/src/widgets/area_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
      appBar: AppBarWidget(
        showAvatar: false,
        showBack: true,
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              maxHeight: 256,
              minHeight: 256,
              child: Container(
                color: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
                child: _UserProfile(themeProvider: _themeProvider),
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

class _UserProfile extends StatelessWidget {
  final ThemeProvider themeProvider;
  const _UserProfile({
    Key key, 
    @required this.themeProvider
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 12,
        right: 12,
      ),
      child: Container(
        height: 64,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: themeProvider.darkTheme ? Colors.grey[800] : Colors.black26.withOpacity(0.18),
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding + 10),
          color: themeProvider.darkTheme ? kDMBackgroundPrimary : Colors.white, 
          boxShadow: [
            BoxShadow(
              color: themeProvider.darkTheme ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.2), 
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: 68,
                height: 68,
                child: AppAvatarWidget(
                  //TODO traer los datos adecuados del logueo
                  avatarImage: "",
                  inicials: "DM",
                  animateShowAvatar: true,
                  sizeRadius: 62,
                ),
              ),
              const SizedBox(height: (kDefaultPadding/2) - 4),
              Text(
                //TODO traer los datos adecuados del logueo
                "Darío Madeira",
                style: TextStyle(
                  fontSize: 22,
                  color: themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kDefaultPadding/2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AptSettingsBtnWidget(
                    textBtn: AppLocalizations.of(context).translate("profile.delete.account"),
                    btnColor: Color(0xFFFF1E39),
                    icon: Icons.delete_forever,
                    isDark: themeProvider.darkTheme,
                  ),
                  const SizedBox(width: kDefaultPadding + 10),
                  AptSettingsBtnWidget(
                    textBtn: AppLocalizations.of(context).translate("profile.logout"),
                    btnColor: Color(0xFF981AD9),
                    icon: Icons.exit_to_app,
                    isDark: themeProvider.darkTheme,
                  ),
                  const SizedBox(width: kDefaultPadding + 10),
                  AptSettingsBtnWidget(
                    textBtn: AppLocalizations.of(context).translate("profile.change.picture"),
                    btnColor: Color(0xFF1A6CD9),
                    icon: Icons.camera_alt_outlined,
                    isDark: themeProvider.darkTheme,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}