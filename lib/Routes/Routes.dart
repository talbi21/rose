import 'package:flutter/material.dart';

import '../ui/Home/home_page.dart';
import '../ui/Login/loading_page.dart';
import '../ui/Login/login_page.dart';
import '../ui/Login/register_page.dart';
import '../ui/Profile/profile_page.dart';
import '../ui/Start/start_home_page.dart';


Map<String, Widget Function(BuildContext context)> routes = {

  'loadingPage'   : ( context ) => LoadingPage(),
  'getStarted'    : ( context ) => StartHomePage(),
  'signInPage'    : ( context ) => SignInPage(),
  'signUpPage'    : ( context ) => SignUpPage(),
   'homePage'      : ( context ) => HomePage(),
  // 'cartPage'      : ( context ) => CartPage(),
  // 'favoritePage'  : ( context ) => FavoritePage(),
   'profilePage'   : ( context ) => ProfilePage(),
};