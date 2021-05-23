import 'package:appetit/src/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;
    return BackgroundWidget(
      bgImage: 1,
      pageBody: Center(
        child: Text("favoritos"),
      ),
    );
  }
}