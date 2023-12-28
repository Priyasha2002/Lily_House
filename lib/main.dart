import 'package:flutter/material.dart';
import 'package:lily_house/root_screen.dart';
import 'package:lily_house/screens/home_page.dart';
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
          home: const RootScreen(),
        );
      },
      ),
    );
  }
}

