import 'package:appetit/src/helpers/image_helpers.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/widgets/apt_outline_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class EmptyState extends StatelessWidget {

  final String imgPath;
  final String emptyText;
  final String btnText;
  final bool showBtn;
  final Function btnAccion;

  const EmptyState({
    Key key,
    @required this.imgPath,
    @required this.emptyText, 
    @required this.showBtn, 
    this.btnAccion,
    this.btnText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Future.wait([
        loadSvg(context, imgPath),
      ]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imgPath,
                width: size.width / 3.5,
                height: size.width / 3.5,
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                emptyText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Visibility(
                visible: showBtn,
                child: AptOutlineBtnWidget(
                  btnText: btnText,
                  accion: btnAccion,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}