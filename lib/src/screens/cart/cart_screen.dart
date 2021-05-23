import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/bottom_navigation_provider.dart';
import 'package:appetit/src/widgets/empty_state_widget.dart';
import 'package:appetit/src/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment = false;
    final _tabsProvider = Provider.of<TabsNavigationProvider>(context);
    return BackgroundWidget(
      bgImage: 1,
      pageBody: EmptyState(
        btnText: AppLocalizations.of(context).translate("cart.empty.btn.explore.now"),
        imgPath: "assets/svgs/food-bank.svg",
        emptyText: AppLocalizations.of(context).translate("cart.empty"), 
        btnAccion: () {
          _tabsProvider.changeBottomBarIndex(0);
        }, 
        showBtn: true,
      ),
    );
  }
}
