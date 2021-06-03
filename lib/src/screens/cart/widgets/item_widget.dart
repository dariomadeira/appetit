import 'package:appetit/constants.dart';
import 'package:appetit/src/customs/appetit_icons.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/widgets/apt_rounder_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget cartCard(BuildContext context) {
  final _size = MediaQuery.of(context).size;
  final _themeProvider = Provider.of<ThemeProvider>(context);
  return Dismissible(
    key: UniqueKey(),
    direction: DismissDirection.startToEnd,
    onDismissed: (direction) {
      //TODO BORRAR NOTIFIACION
      print('direction: $direction'); 
    },
    background: Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding/2,
        right: kDefaultPadding/2,
        bottom: kDefaultPadding/2,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Appetit.erase,
              color: Colors.red,
              size: 32,
            ),
            const SizedBox(width: 4),
            Text(
              AppLocalizations.of(context).translate("cart.delete"),
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ),
    child: Container(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultPadding -4),
            child: FadeInImage(
              fit: BoxFit.cover,
              height: _size.width / 4.2,
              width: _size.width / 3.4,
              image: NetworkImage(
                "https://vinomanos.com/wp-content/uploads/2019/09/Milanesa-perfecta.jpg",
              ),
              placeholder: AssetImage('assets/animations/DGKM.gif'),
            ),
          ),
          const SizedBox(width: kDefaultPadding/1.6),
          Expanded(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //TODO producto
                      'Milanesa con papas fritas y huevo',
                      style: TextStyle(
                        fontSize: 18,
                        color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                        fontWeight: FontWeight.w800,
                        height: 1.1
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate("cart.count"),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  // TODO CANTIDAD
                                  '1',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kPriceColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate("cart.pricex1"),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  //TODO traer el precio
                                  '\$ 100,00',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kPriceColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate("cart.price"),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  //PRECIO TOTAL
                                  '\$ 100,00',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kPriceColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ),
          Column(
            children: [
              AptRounderBtnWidget(
                accion: () {},
                btnSize: 40,
                icon: Icons.keyboard_arrow_up,
              ),
              const SizedBox(height: (kDefaultPadding/2) - 4),
              AptRounderBtnWidget(
                accion: () {},
                btnSize: 40,
                icon: Icons.keyboard_arrow_down,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}