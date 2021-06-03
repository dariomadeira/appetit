import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmallStarBadgeWidget extends StatelessWidget {

  const SmallStarBadgeWidget({
    Key key,
    @required this.itemStars,
  }) : super(key: key);

  final String itemStars;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Positioned(
      top: 103,
      left: kDefaultPadding/2 + 4,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: itemStars.length >= 3 ? 6 :0,
        ),
        decoration: BoxDecoration(
          color: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
          borderRadius: BorderRadius.circular(kDefaultPadding),
          boxShadow: [
            BoxShadow(
              color: _themeProvider.darkTheme ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 0),
            )
          ],
        ),
        constraints: BoxConstraints(
          minWidth: 50,
          minHeight: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.star, size: 15, color: Colors.amber,),
                const SizedBox( width: 4),
                Text(
                  itemStars,
                  style: TextStyle(
                    color:  _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}