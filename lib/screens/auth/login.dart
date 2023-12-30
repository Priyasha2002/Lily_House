import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/screens/auth/forgot_password.dart';
import 'package:lily_house/screens/auth/register.dart';
import 'package:lily_house/widgets/app_name_text.dart';
import 'package:lily_house/widgets/auth/google_button.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override


  void initState(){
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    //Focus Nodes
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }
  @override

  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    // Focus Nodes
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }


  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                const AppNameTextWidget(
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                    child: TitleTextWidget(label: "Welcome back"),

                ),
                const SizedBox(
                  height: 16.0,
                ),
                Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: Icon(
                              IconlyLight.message,
                            ),
                          ),
                          validator: (value){
                            return MyValidators.emailValidator(value);
                          },
                          onFieldSubmitted: (value){
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(
                              IconlyLight.lock,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.purple.shade400,
                              onPressed: (){
                                setState(() {
                                  obscureText= !obscureText;
                                });
                              },
                              icon: Icon(obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off
                              ),
                            ),
                          ),
                          validator: (value){
                            return MyValidators.passwordValidator(value);
                          },
                          onFieldSubmitted: (value){
                            _loginFct();
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(
                                      context,
                                      ForgotPasswordScreen.routeName,
                                    );
                                  },
                                  child: const SubtitleTextWidget(
                                    label: "Forgot Password",
                                    textDecoration: TextDecoration.underline,
                                    fontStyle: FontStyle.italic,
                                  ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                              onPressed: () async {
                              _loginFct();
                              },
                              icon: const Icon(Icons.login),
                              label: const Text(
                                "login",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SubtitleTextWidget(
                            label: "Or connect using".toUpperCase(),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          height: kBottomNavigationBarHeight+10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                flex: 2,
                                  child:SizedBox(
                                    height: kBottomNavigationBarHeight,
                                    child: FittedBox(
                                        child: GoogleButton()
                                    ),
                                  ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(12),
                                        //backgroundColor: Colors.purple.shade100,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                      onPressed: (){
                                        },
                                      child: const Text("Guest",
                                      style: TextStyle(
                                        fontSize: 20
                                      )
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SubtitleTextWidget(
                                label: "Don't have an account?"
                            ),
                            TextButton(
                                child: const SubtitleTextWidget(
                                    label: "Sign Up",
                                  textDecoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
                                ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RegisterScreen.routeName,
                                );
                              },
                            )
                          ],
                        )

                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyValidators {
  static String? displayNamevalidator(String? displayName){
    if (displayName == null || displayName.isEmpty){
      return "Display name cannot be empty";
    }
    if (displayName.length < 3 || displayName.length >20){
      return "Display name must be between 3 and 20 characters";
    }
    return null ; //Return null i display name is valid
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter an email address";
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
    .hasMatch(value)){
      return "Please enter a valid email";
    }
    return null;
  }

  static String? passwordValidator(String? value){
    if (value!.isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }
  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
