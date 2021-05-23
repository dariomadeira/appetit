import 'package:appetit/constants.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/screens/profile/widgets/option_tile_widget.dart';
import 'package:appetit/src/widgets/app_avatar_widget.dart';
import 'package:appetit/src/widgets/apt_outline_btn_widget.dart';
import 'package:appetit/src/widgets/area_title_widget.dart';
import 'package:appetit/src/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return BackgroundWidget(
      bgImage: 1,
      showAvatar: false,
      pageBody: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding, left: kDefaultPadding, right: kDefaultPadding, bottom: kDefaultPadding + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   padding: EdgeInsets.all(kDefaultPadding),
              //   width: MediaQuery.of(context).size.width,
              //   height: 160,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.1),
              //         spreadRadius: 2,
              //         blurRadius: 2,
              //         offset: Offset(1, 1),
              //       ),
              //     ],
              //     border: Border.all(color: Colors.black.withOpacity(0.2), width: 0.8),
              //   ),
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.width / 3.5,
                      width: size.width / 3.5,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          AppAvatarWidget(
                            //TODO traer los datos adecuados del logueo
                            avatarImage: "https://ep01.epimg.net/elpais/imagenes/2018/12/13/buenavida/1544715127_368245_1544786854_noticia_normal.jpg",
                            // avatarImage: "",
                            inicials: "DM",
                            animateShowAvatar: true,
                            sizeRadius: size.width / 3.5,
                          ),
                          Positioned(
                            right: -12,
                            bottom: 0,
                            child: SizedBox(
                              height: 48,
                              width: 48,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: kPrimaryColor,
                                  shape: CircleBorder(),
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      // TODO traer el nombre
                      "Darío Madeira",
                      style: TextStyle(
                        fontSize: 26,
                        color: _themeProvider.darkTheme ? kDMTitleTextColor : kTitleTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AptOutlineBtnWidget(
                      btnText: AppLocalizations.of(context).translate("profile.delete.account"),
                      themeProvider: _themeProvider,
                      accion: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
              _switchDark(context),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {},
                    icon: Icon(Icons.exit_to_app_outlined),
                    label: Text(AppLocalizations.of(context).translate("profile.logout")),
                    backgroundColor: kPrimaryColor,
                    highlightElevation: 0,
                    focusElevation: 0,
                    elevation: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _switchDark(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
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
        SizedBox(height: 16),
      ],
    );
  }
}