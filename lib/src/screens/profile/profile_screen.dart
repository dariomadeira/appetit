import 'package:appetit/constants.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/screens/profile/widgets/option_tile_widget.dart';
import 'package:appetit/src/widgets/app_avatar_widget.dart';
import 'package:appetit/src/widgets/app_bar_widget.dart';
import 'package:appetit/src/widgets/apt_header.dart';
import 'package:appetit/src/widgets/apt_settings_btn_widget.dart';
import 'package:appetit/src/widgets/area_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  final List<Map<String, dynamic>> settings = [
    {
      "traduction": "profile.email",
      "data": "",
      "icon": Icons.email_outlined,
      "color": Color(0xFF9C27B0),
    },
    {
      "traduction": "profile.phone",
      "data": "",
      "icon": Icons.phone_android_outlined,
      "color": Color(0xFFFF9800),
    },
    {
      "traduction": "profile.address",
      "data": "",
      "icon": Icons.place_outlined,
      "color": Color(0xFFAFB42B),
    },
    {
      "traduction": "profile.join.date",
      "data": "",
      "icon": Icons.calendar_today_outlined,
      "color": Color(0xFF3949AB),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
      appBar: AppBarWidget(
        showAvatar: false,
        showBack: true,
        showLogo: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
          bottom: kDefaultPadding * 4,
        ),
        children: [
          AptHeader(
            imageAsset: "assets/svgs/headerProfile.svg",
            title: AppLocalizations.of(context).translate("profile.hi"),
            //TODO traer los datos adecuados del logueo
            subtitle: "Darío Madeira",
            headerWidget: Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 78,
                  height: 78,
                  child: AppAvatarWidget(
                    //TODO traer los datos adecuados del logueo
                    avatarImage: "",
                    inicials: "DM",
                    sizeRadius: 78,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AptSettingsBtnWidget(
                  textBtn: AppLocalizations.of(context).translate("profile.delete.account"),
                  btnColor: Color(0xFFF44336),
                  icon: Icons.delete_forever,
                ),
                const SizedBox(width: kDefaultPadding * 2.5),
                AptSettingsBtnWidget(
                  textBtn: AppLocalizations.of(context).translate("profile.logout"),
                  btnColor: Color(0xFF26A69A),
                  icon: Icons.exit_to_app,
                ),
                const SizedBox(width: kDefaultPadding * 2.5),
                AptSettingsBtnWidget(
                  textBtn: AppLocalizations.of(context).translate("profile.change.picture"),
                  btnColor: Color(0xFF03A9F4),
                  icon: Icons.camera_alt_outlined,
                ),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 2, right: kDefaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AreaTitleWidget(
                  title: AppLocalizations.of(context).translate("profile.about.me"),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: settings.length,
                  itemBuilder: (_, index) {
                    return OptionTile(
                      btnTitle: AppLocalizations.of(context).translate(settings[index]["traduction"]),
                      btnSubtitle: settings[index]["data"],
                      iconBtn: settings[index]["icon"],
                      iconColor: settings[index]["color"],
                    );
                  },
                ),
                AreaTitleWidget(
                  title: AppLocalizations.of(context).translate("profile.config"),
                ),
                const SizedBox(height: 16),
                _switchDark(context, _themeProvider),
              ],
            ),
          ),
        ],
      )
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
