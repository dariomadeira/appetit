import 'package:appetit/constants.dart';
import 'package:appetit/src/providers/theme_provider.dart';
import 'package:appetit/src/widgets/apt_arrow_btn.dart';
import 'package:appetit/src/widgets/apt_rounder_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget cartCard(BuildContext context) {
  final _size = MediaQuery.of(context).size;
  final _themeProvider = Provider.of<ThemeProvider>(context);
  return Card(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultPadding)),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(kDefaultPadding), bottomRight: Radius.circular(kDefaultPadding)),
          child: FadeInImage(
            fit: BoxFit.cover,
            height: _size.width / 2,
            width: _size.width,
            image: NetworkImage(
              "https://vinomanos.com/wp-content/uploads/2019/09/Milanesa-perfecta.jpg",
            ),
            placeholder: AssetImage('assets/animations/loader.gif'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'MILANESA CON PAPAS FRITAS',
                      style: TextStyle(
                        fontSize: 18,
                        color: _themeProvider.darkTheme ? kDMTitleTextColor : kLMTitleTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  // const SizedBox(width: kDefaultPadding/2),
                  // AptRounderBtnWidget(
                  //   accion: () {
                      
                  //   },
                  //   btnSize: 40,
                  //   icon: Icons.close,
                  //   backgroundColor: Colors.red,
                  // ),
                ],
              ),




              const SizedBox(height: kDefaultPadding/2),
              Text(
                'Una sucuelanta milanesa de ternera con muchas papasfritas y una rodaja de limon que se que te gusta mucho.',
                style: TextStyle(
                  fontSize: 14,
                  color: _themeProvider.darkTheme ? kDMTextColor : kLMTextColor,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cantidad:',
                          style: TextStyle(
                            fontSize: 16,
                            color: kLMTextColor,
                          ),
                        ),
                        Text(
                          'Cantidad:',
                          style: TextStyle(
                            fontSize: 16,
                            color: kLMTextColor,
                          ),
                        ),
                        Text(
                          'Cantidad:',
                          style: TextStyle(
                            fontSize: 16,
                            color: kLMTextColor,
                          ),
                        ),
                        
                      ],
                    )
                  ),
                  Column(
                    children: [
                      AptArrowBtn(
                        icon: Icons.keyboard_arrow_up,
                        accion: () {
                          
                        },
                      ),
                      const SizedBox(height: (kDefaultPadding/2) - 4),
                      AptArrowBtn(
                         icon: Icons.keyboard_arrow_down,
                        accion: () {
                          
                        },
                      ),
                    ],
                  )
                ],
              )




              
            ],
          ),
        ),
      ],
    ),
  );
}