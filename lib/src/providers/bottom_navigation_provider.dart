import 'package:appetit/src/screens/cart/cart_screen.dart';
import 'package:appetit/src/screens/explore/explore_screen.dart';
import 'package:appetit/src/screens/favorites/favorites_screen.dart';
import 'package:appetit/src/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationProvider with ChangeNotifier {
  
  int currentIndex = 0;

  // CAMBIO DE LA BOTTOMBAR
  void changeBottomBarIndex(index) async {
    currentIndex = index;
    notifyListeners();
  }

  // MANEJO DE LAS PANTALLAS
  Widget callScreen(int index) {
    switch (index) {
      case 0:
        return ExploreScreen();
      case 1:
        return FavoritesScreen();
      case 2:
        return CartScreen();
      case 3:
        return ProfileScreen();
      default:
        return ExploreScreen();
    }
  }
}
