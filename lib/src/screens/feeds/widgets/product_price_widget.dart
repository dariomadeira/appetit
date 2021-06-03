import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPriceWidget extends StatelessWidget {

  const ProductPriceWidget({
    Key key,
    @required this.itemPrice,
  }) : super(key: key);

  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: itemPrice.length >= 3 ? 6 :0,
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
          minWidth: 20,
          minHeight: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              itemPrice,
              style: TextStyle(
                color: kPriceColor,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}