import 'dart:ui';
import 'package:appetit/src/helpers/image_helpers.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/widgets/app_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class BackgroundWidget extends StatelessWidget {

  final int bgImage;
  final Widget pageBody;
  final bool showAppBar;
  final double bgOpacity;
  final bool showAvatar;
  final FloatingActionButton floatBtn;

  const BackgroundWidget({
    Key key,
    @required this.bgImage,
    @required this.pageBody,
    this.showAppBar = true,
    this.bgOpacity = 0.5,
    this.showAvatar = true,
    this.floatBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    // String _calculateBGImage(int bgImage) {
    //   String response;
    //   if (bgImage == 1) {
    //     if (_themeProvider.darkTheme) {
    //       response = "assets/images/bg1Dark.jpg";
    //     } else {
    //       response = "assets/images/bg1.jpg";
    //     }
    //   } else if (bgImage == 2) {
    //     if (_themeProvider.darkTheme) {
    //       response = "assets/images/bg2Dark.jpg";
    //     } else {
    //       response = "assets/images/bg2.jpg";
    //     }
    //   }
    //   return response;
    // }

    return FutureBuilder(
      future: Future.wait([
        // loadByAsset(context, _calculateBGImage(bgImage)),
        Future.delayed(Duration(milliseconds: kDefaulWait)),
      ]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            color: _themeProvider.darkTheme ? kDMwaitScreen : Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  kPrimaryColor,
                ),
              ),
            ),
          );
        }
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                // child: Image.asset(_calculateBGImage(bgImage),fit: BoxFit.cover,),
                ),
            Positioned.fill(
              child: Scaffold(
                // backgroundColor: _themeProvider.darkTheme ? Colors.black.withOpacity(0.4) : Colors.white.withOpacity(bgOpacity),
                backgroundColor: _themeProvider.darkTheme ? kDMwaitScreen : Colors.white,
                body: pageBody,
                appBar: this.showAppBar
                  ? AppBar(
                      toolbarHeight: 60,
                      iconTheme: IconThemeData(
                        color: _themeProvider.darkTheme ? kDMTitleTextColor : kTitleTextColor,
                      ),
                      centerTitle: true,
                      title: SvgPicture.asset(
                        'assets/svgs/logo.svg',
                        semanticsLabel: 'Appetit',
                        width: 120,
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      // backgroundColor:  _themeProvider.darkTheme ? kDMBottomNabBar : Colors.white,
                      actions: showAvatar
                        ? [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'profile');
                              },
                              child: AppAvatarWidget(
                                //TODO traer los datos adecuados del logueo
                                // avatarImage: "https://ep01.epimg.net/elpais/imagenes/2018/12/13/buenavida/1544715127_368245_1544786854_noticia_normal.jpg",
                                avatarImage: "",
                                inicials: "DM",
                                animateShowAvatar: true,
                              ),
                            ),
                            SizedBox(width: 12),
                          ]
                        : null,
                    )
                  : null,
                floatingActionButton: floatBtn,
              ),
            ),
          ],
        );
      },
    );
  }
}
