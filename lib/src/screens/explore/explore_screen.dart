import 'package:appetit/src/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      pageBody: Center(
        child: Text("Explorar"),
      ),
    );
  }
}
