import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class ExploreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: _themeProvider.darkTheme ? kDMBackgroundScreen : kLMBackgroundScreen,
      appBar: AppBarWidget(
        showAvatar: true,
        showBack: false,
        showSearch: true,
        accionSearch: () {},
      ),
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}