import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AptHeader extends StatelessWidget {

  final String title;
  final String subtitle;
  final String imageAsset;
  final Widget headerWidget;

  const AptHeader({
    Key key,
    @required this.title,
    this.subtitle,
    @required this.imageAsset,
    this.headerWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width / 2.3,
            child: FittedBox(
              child: SvgPicture.asset(imageAsset),
              fit: BoxFit.fill,
            )),
        Positioned(
          top: kDefaultPadding / 2,
          left: kDefaultPadding,
          child: Column(
            crossAxisAlignment: (headerWidget != null) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 26,
                  color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (subtitle != null) Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
               if (headerWidget != null) headerWidget,
            ],
          ),
        ),
      ],
    );
  }
}
