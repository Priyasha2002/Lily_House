import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lily_house/models/user_model.dart';
import 'package:lily_house/screens/auth/login.dart';
import 'package:lily_house/screens/loading_manager.dart';
import 'package:lily_house/screens/viewed_recently.dart';
import 'package:lily_house/screens/wishlist_screen.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/services/my_app_methods.dart';
import 'package:lily_house/widgets/app_name_text.dart';
import 'package:lily_house/widgets/custom_list_tile.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';

import '../consts/providers/theme_provider.dart';
import '../consts/providers/user_provider.dart';
import 'auth/register.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool _isLoading = false;


  Future<void> fetchUserInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      setState(() {
        _isLoading = false;
      });
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      await MyAppMethods.showErrorORWarningDialog(
        context: context,
        subtitle: error.toString(),
        fct: () {},
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Image.asset(AssetsManager.shoppingCart),
      ),
      body:LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: user == null ? true : false,
                  child: Padding(
                           padding: EdgeInsets.all(20.0),
                            child: TitleTextWidget(
                            label: "Log in to have ultimate access"),
                ),
              ),
              const SizedBox(height: 20),
              userModel == null
                  ?const SizedBox.shrink()
              :Padding(
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
                        image:  DecorationImage(
                            image:  NetworkImage(
                              userModel!.userImage,
                            ),
                            fit: BoxFit.fill,
                        ),
                      ),




                    ),
                    const SizedBox(
                      width: 10
                    ),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(label: userModel!.userName),
                        SubtitleTextWidget(label: userModel!.userEmail)
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
                          Navigator.pushNamed(context, WishlistScreen.routeName);
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
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (user == null){
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          } else{
                            await MyAppMethods.showErrorORWarningDialog(
                                context: context,
                                subtitle: "Are you sure?",
                                isError: false,
                                fct: () async {
                                  await FirebaseAuth.instance.signOut();
                                  if (!mounted) return ;
                                  Navigator.pushNamed(context, LoginScreen.routeName);
                                }
                            );
                          }
                        },
                        icon: Icon(user == null ? Icons.login : Icons.logout),
                        label: Text(user == null ? "Login" : "Logout"),
                      ),
                      ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

