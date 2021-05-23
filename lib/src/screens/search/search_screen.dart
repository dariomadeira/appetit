import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;
    return Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}