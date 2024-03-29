import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lily_house/consts/app_constants.dart';
import 'package:lily_house/consts/providers/cart_provider.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/consts/providers/viewed_prod_provider.dart';
import 'package:lily_house/consts/providers/wishlist_provider.dart';
import 'package:lily_house/root_screen.dart';
import 'package:lily_house/screens/auth/forgot_password.dart';
import 'package:lily_house/screens/auth/login.dart';
import 'package:lily_house/screens/auth/register.dart';
import 'package:lily_house/screens/product_details.dart';
import 'package:lily_house/screens/profile_screen.dart';
import 'package:lily_house/screens/search_screen.dart';
import 'package:lily_house/screens/viewed_recently.dart';
import 'package:lily_house/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

import 'consts/providers/theme_provider.dart';
import 'consts/providers/user_provider.dart';
import 'consts/theme_data.dart';



void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<FirebaseApp>(
      future: Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: AppConstants.apiKey,
            appId: AppConstants.appId,
            messagingSenderId: AppConstants.messagingSenderId,
            projectId: AppConstants.projectId,
            storageBucket: AppConstants.storagebucket
        ),
      ),
      builder: (context , snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                )
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Center(
                  child: SelectableText(""
                      "An error has been occurred ${snapshot.error}"),
                )
            ),
          );
        }

        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider(create: (context) => CartProvider(),
          ),
          ChangeNotifierProvider(create: (context) => WishListProvider(),
          ),
          ChangeNotifierProvider(create: (context) => ViewedProdProvider(),
          ),
          ChangeNotifierProvider(create: (_) {
            return UserProvider();
          }),
        ],
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                title: 'Welcome to LILY HOUSE',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const ProfileScreen(),
                routes: {
                  ProductDetails.routeName: (context) => const ProductDetails(),
                  WishlistScreen.routeName: (context) => const WishlistScreen(),
                  RecentlyViewedScreen.routeName: (
                      context) => const RecentlyViewedScreen(),
                  RegisterScreen.routeName: (context) => const RegisterScreen(),
                  ForgotPasswordScreen.routeName: (
                      context) => const ForgotPasswordScreen(),
                  LoginScreen.routeName: (context) => const LoginScreen(),
                  SearchScreen.routeName: (context) => const SearchScreen()
                },
              );
            },
          ),
        );
      }
    );
  }
}

