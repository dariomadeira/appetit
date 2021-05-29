import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class AppAvatarWidget extends StatelessWidget {
  final String avatarImage;
  final String inicials;
  final double sizeRadius;

  const AppAvatarWidget({
    Key key,
    @required this.avatarImage,
    @required this.inicials,
    this.sizeRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    Color _calculateBGColor() {
      if (_themeProvider.darkTheme) {
        return kPrimaryColor;
      } else {
        return kPrimaryColor.withOpacity(0.3);
      }
    }

    Color _calculateColorInicials() {
      if (_themeProvider.darkTheme) {
        return Colors.white.withOpacity(0.8);
      } else {
        return kPrimaryColor;
      }
    }

    return Stack(
      children: [
        Container(
          width: sizeRadius * 2,
          height: sizeRadius * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizeRadius),
            color: Colors.white,
          ),
        ),
        CircleAvatar(
          radius: sizeRadius,
          backgroundColor: _calculateBGColor(),
          backgroundImage: (avatarImage != "") ? NetworkImage(avatarImage) : null,
          child: (avatarImage == "")
            ? Text(
                inicials,
                style: TextStyle(
                  color: _calculateColorInicials(),
                  fontWeight: FontWeight.w800,
                  fontSize: (sizeRadius > 20) ? sizeRadius / 2 : sizeRadius * 0.8,
                ),
              )
            : null,
        ),
      ],
    );
  }
}
