import 'package:appetit/src/localizations/app_localization.dart';
import 'package:appetit/src/preferences/preferences.dart';
import 'package:appetit/src/providers/bottom_navigation_provider.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/routers/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new AppPreferences();
  await prefs.initPref();
  await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svgs/logo.svg'), null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new TabsNavigationProvider()),
        ChangeNotifierProvider(create: (_)=> new ThemeProvider()),
      ],
      child: MyApp()
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefs = AppPreferences();
  @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).initTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;
    final _themeProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: _themeProvider.darkTheme ? Brightness.light : Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
      systemNavigationBarIconBrightness: _themeProvider.darkTheme ? Brightness.light : Brightness.dark,
    ));
    return MaterialApp(
      supportedLocales: kSupportedLenguajes,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'appetit',
      theme: ThemeData(
        fontFamily: 'ProductSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color(0xFFFD5616),
      ),
      initialRoute:  (prefs.readPreferenceBool("welcome")) ? 'home' : 'welcome',
      // initialRoute: "welcome",
      routes: appRoutes,
    );
  }
}