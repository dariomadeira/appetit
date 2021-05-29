import 'package:animate_do/animate_do.dart';
import 'package:appetit/src/customs/appetit_icons.dart';
import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/bottom_navigation_provider.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/screens/cart/widgets/item_widget.dart';
import 'package:appetit/src/widgets/app_bar_widget.dart';
import 'package:appetit/src/widgets/apt_header.dart';
import 'package:appetit/src/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    final _tabsProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      backgroundColor: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
      appBar: AppBarWidget(
        showAvatar: true,
        showBack: false,
        showCartEmpty: true,
        cartPrice: "\$ 900,00",
        showLogo: false,
        accionCartEmpty: () {

        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        icon: Icon(Appetit.pagar, color: Colors.white),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        onPressed: () {},
        label: Text(
          AppLocalizations.of(context).translate("cart.btn.paid"),
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        
      ),
      body: 
      
      ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: kDefaultPadding/2,
          right: kDefaultPadding/2,
          bottom: kDefaultPadding*4,
        ),
        children: [

          AptHeader(
            imageAsset: "assets/svgs/headerCart.svg",
            title: AppLocalizations.of(context).translate("cart.header.title"),
            subtitle: AppLocalizations.of(context).translate("cart.header.subtitle"),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SlideInLeft(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Appetit.deslizar,
                    color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                  ),
                  const SizedBox(width: kDefaultPadding/2),
                  Text(
                    AppLocalizations.of(context).translate("cart.header.slide"),
                    style: TextStyle(
                      fontSize: 14,
                      color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                ],
              ),
            ),
          ),

          cartCard(context),
        ],
      )
      
      
      // EmptyState(
      //   btnText: AppLocalizations.of(context).translate("cart.empty.btn.explore.now"),
      //   imgPath: "assets/svgs/food-bank.svg",
      //   emptyText: AppLocalizations.of(context).translate("cart.empty"), 
      //   btnAccion: () {
      //     _tabsProvider.changeBottomBarIndex(0);
      //   }, 
      //   showBtn: true,
      // ),
    );
  }
}
