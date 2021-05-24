import 'package:animate_do/animate_do.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class AppAvatarWidget extends StatelessWidget {

  final String avatarImage;
  final String inicials;
  final bool animateShowAvatar;
  final double sizeRadius;  

  const AppAvatarWidget({
    Key key,
    @required this.avatarImage,
    @required this.inicials,
    @required this.animateShowAvatar,
    this.sizeRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    Color _calculateBGColor() {
      if (_themeProvider.darkTheme) {
        return kSecondaryColor;
      } else {
        return kSecondaryColor.withOpacity(0.3);
      }
    }

    Color _calculateColorInicials() {
      if (_themeProvider.darkTheme) {
        return Colors.white.withOpacity(0.8);
      } else {
        return kSecondaryColor;
      }
    }

    return CircleAvatar(
      radius: sizeRadius,
      backgroundColor: _calculateBGColor(),
      child: (avatarImage == "")
        ? Text(
            inicials,
            style: TextStyle(
              color: _calculateColorInicials(),
              fontWeight: FontWeight.w800,
              fontSize: (sizeRadius > 20) ? sizeRadius / 2 : sizeRadius * 0.8,
            ),
          )
        : ClipOval(
            child: (animateShowAvatar)
              ? FadeIn(
                  delay: Duration(milliseconds: 1000),
                  child: Image.network(
                    avatarImage,
                    fit: BoxFit.cover,
                    width: sizeRadius * 2,
                    height: sizeRadius * 2,
                  ),
                )
              : Image.network(
                  avatarImage,
                  fit: BoxFit.cover,
                  width: sizeRadius * 2,
                  height: sizeRadius * 2,
                ),
          ),
    );
  }
}
