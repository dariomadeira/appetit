import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionTile extends StatelessWidget {
  
  final String btnTitle;
  final String btnSubtitle;
  final IconData iconBtn;
  final bool noBottomSpace;
  final Color iconColor;

  const OptionTile({
    @required this.btnTitle,
    @required this.iconBtn,
    this.btnSubtitle = "",
    this.noBottomSpace = true,
    @required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    Color _calculateBGColor(Color iconColor) {
      if (_themeProvider.darkTheme) {
        return iconColor;
      } else {
        return iconColor.withOpacity(0.2);
      }
    }

    Color _calculateColor(Color iconColor) {
      if (_themeProvider.darkTheme) {
        return Colors.white.withOpacity(0.8);
      } else {
        return iconColor;
      }
    }

    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: _calculateBGColor(iconColor),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Icon(
                  iconBtn,
                  color: _calculateColor(iconColor),
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    btnTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Visibility(
                    visible: btnSubtitle != "",
                    child: Text(
                      btnSubtitle,
                      style: TextStyle(
                        fontSize: 14,
                        // color: kGrayDark,
                        color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: noBottomSpace,
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}
