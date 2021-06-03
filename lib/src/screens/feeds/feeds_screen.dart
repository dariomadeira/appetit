import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/screens/feeds/widgets/product_price_widget.dart';
import 'package:appetit/src/screens/feeds/widgets/small_star_badge_widget.dart';
import 'package:appetit/src/widgets/app_bar_widget.dart';
import 'package:appetit/src/widgets/apt_header.dart';
import 'package:appetit/src/widgets/area_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class FeedsScreen extends StatelessWidget {

  final _uniKey = UniqueKey();
  final String itemPrice = "\$ 100,00";
  final String itemStars = "5";

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
      appBar: AppBarWidget(
        showAvatar: true,
        showBack: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: kDefaultPadding * 4,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding / 2,
              right: kDefaultPadding / 2,
            ),
            child: AptHeader(
              imageAsset: "assets/svgs/headerNews.svg",
              title: AppLocalizations.of(context).translate("feed.header.title"),
              subtitle: AppLocalizations.of(context).translate("feed.header.subtitle"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding, top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
            child: AreaTitleWidget(
              title: AppLocalizations.of(context).translate("feed.new.title"),
            ),
          ),
          Container(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.only(
                    right: kDefaultPadding,
                    left: index == 0 ? kDefaultPadding : 0,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultPadding / 2 + 4),
                    color: _themeProvider.darkTheme ? kDMSpecialBackground : kLMSpecialBackground,
                    boxShadow: [
                      BoxShadow(
                        color: _themeProvider.darkTheme ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Hero(
                          tag: _uniKey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kDefaultPadding / 2 + 4),
                            child: FadeInImage(
                              image: NetworkImage("https://sevilla.abc.es/gurme/wp-content/uploads/sites/24/2016/03/hamburguesa-tofu-960x540.jpg"),
                              placeholder: AssetImage('assets/animations/DGKM.gif'),
                              fit: BoxFit.cover,
                              height: 116,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text(
                              "Albondigas con puré de papas",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                                fontWeight: FontWeight.w900,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      ProductPriceWidget(itemPrice: itemPrice),
                      SmallStarBadgeWidget(itemStars: itemStars),
                    ],
                  ),
                );
              },
            ),
          ),
        ]
      ),
    );
  }
}
