import 'package:flutter/material.dart';
import 'package:lily_house/screens/auth/login.dart';
import 'package:lily_house/screens/viewed_recently.dart';
import 'package:lily_house/screens/wishlist_screen.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/app_name_text.dart';
import 'package:lily_house/widgets/custom_list_tile.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';

import '../consts/providers/theme_provider.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Image.asset(AssetsManager.shoppingCart),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible : false,
                child: Padding(
                         padding: EdgeInsets.all(20.0),
                          child: TitleTextWidget(
                          label: "Log in to have ultimate access"),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border:  Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width:3
                      ),
                      image: const DecorationImage(
                          image: NetworkImage("https://images.pexels.com/photos/3764119/pexels-photo-3764119.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                          fit: BoxFit.fill,
                      ),
                    ),
        
        
        
        
                  ),
                  const SizedBox(
                    width: 10
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextWidget(label: "Priyasha Ghosh"),
                      SubtitleTextWidget(label: "ghoshpriyasha29@gmail.com")
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleTextWidget(label: "General"),
                  CustomListTile(
                      imagePath: AssetsManager.orderSvg,
                      text: "All orders",
                      function:(){}),
                  CustomListTile(
                      imagePath: AssetsManager.wishlistSvg,
                      text: "Wishlist",
                      function:(){
                        Navigator.pushNamed(context, WishListScreen.routeName);
                      }),
                  CustomListTile(
                      imagePath: AssetsManager.recent,
                      text: "Viewed Recently",
                      function:(){
                        Navigator.pushNamed(context, RecentlyViewedScreen.routeName);
                      }),
                  CustomListTile(
                      imagePath: AssetsManager.address,
                      text: "Address",
                      function:(){}),
                  const SizedBox(
                    height: 30,
                  ),
                  Divider(
                    thickness: 1,
                  ),

                  TitleTextWidget(label: "Settings"),
                  SwitchListTile(
                    title: Text(themeProvider.getIsDarkTheme ? "Dark Mode" : "Light Mode"),
                    value: themeProvider.getIsDarkTheme,
                    onChanged:(value) {
                      themeProvider.setDarkTheme(themevalue: value);
                    },
                  ),
                  Divider(
                    thickness: 1,
                  ),
              const SizedBox(
                height: 30,
              ),

                  Center(
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: const Text(
                          "Login",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    ),

                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}

