import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ItemWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLMBackgroundScreen,
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          width: MediaQuery.of(context).size.width,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     spreadRadius: 2,
            //     blurRadius: 3,
            //     offset: Offset(1, 1),
            //   ),
            // ],
            border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
          ),
        ),
      ),
   );
  }
}