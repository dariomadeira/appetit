import 'package:appetit/src/screens/cart/cart_screen.dart';
import 'package:appetit/src/screens/explore/explore_screen.dart';
import 'package:appetit/src/screens/favorites/favorites_screen.dart';
import 'package:appetit/src/screens/home/home_screen.dart';
import 'package:appetit/src/screens/profile/profile_screen.dart';
import 'package:appetit/src/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomeScreen(),
  'explore': (_) => ExploreScreen(),
  'cart': (_) => CartScreen(),
  'favorites': (_) => FavoritesScreen(),
  'welcome': (_) => WelcomeScreen(),
  'profile': (_) => ProfileScreen(),
};
