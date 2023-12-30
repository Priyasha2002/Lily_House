import 'package:flutter/material.dart';
import 'package:lily_house/root_screen.dart';
import 'package:lily_house/screens/auth/login.dart';
import 'package:lily_house/screens/auth/register.dart';
import 'package:lily_house/screens/home_page.dart';
import 'package:lily_house/screens/product_details.dart';
import 'package:lily_house/screens/viewed_recently.dart';
import 'package:lily_house/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

import 'consts/providers/theme_provider.dart';
import 'consts/theme_data.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider(),
      ),
    ],
      child: Consumer<ThemeProvider>(builder: (context , themeProvider , child){
        return MaterialApp(
          title: 'Welcome to LILY HOUSE',
          theme: Styles.themeData(
            isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const LoginScreen(),
          routes:{
            ProductDetails.routeName: (context) => const ProductDetails(),
            WishListScreen.routeName: (context) => const WishListScreen(),
            RecentlyViewedScreen.routeName: (context) => const RecentlyViewedScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
          },
        );
      },
      ),
    );
  }
}

