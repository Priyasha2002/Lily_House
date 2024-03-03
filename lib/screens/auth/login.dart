import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lily_house/screens/auth/register.dart';
import 'package:lily_house/screens/loading_manager.dart';
import 'package:lily_house/services/my_app_methods.dart';
import '../../root_screen.dart';
import '../../widgets/app_name_text.dart';
import '../../widgets/auth/google_button.dart';
import '../../widgets/subtitles_text.dart';
import '../../widgets/titles_text.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // Focus Nodes
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passwordController.dispose();
      // Focus Nodes
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _loginFct() async {
    // final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    //if (isValid) {}
      try {
        setState(() {
          _isLoading = true;
        });

        await auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Fluttertoast.showToast(
          msg: "Login Successful",
          textColor: Colors.white,
        );
        if (!mounted) return;
        Navigator.push(
          context,
           MaterialPageRoute(
            builder: (context) => const RootScreen(),
          ),
        );
      } on FirebaseException catch (error) {
        await MyAppMethods.showErrorORWarningDialog(
          context: context,
          subtitle: error.message.toString(),
          fct: () {},
        );
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        body:  LoadingManager(
          isLoading: _isLoading,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const AppNameTextWidget(
                      fontSize: 30,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: TitleTextWidget(label: "Welcome back!")),
                    const SizedBox(
                      height: 16,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "Email address",
                              prefixIcon: Icon(
                                IconlyLight.message,
                              ),
                            ),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (value) {
                              return MyValidators.emailValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            obscureText: obscureText,
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: Icon(
                                  obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              hintText: "***********",
                              prefixIcon: const Icon(
                                IconlyLight.lock,
                              ),
                            ),
                            onFieldSubmitted: (value) async {
                              await _loginFct();
                            },
                            validator: (value) {
                              return MyValidators.passwordValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  ForgotPasswordScreen.routeName,
                                );
                              },
                              child: const SubtitleTextWidget(
                                label: "Forgot password?",
                                fontStyle: FontStyle.italic,
                                textDecoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12.0),
                                // backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ),
                                ),
                              ),
                              icon: const Icon(Icons.login),
                              label: const Text("Login"),
                              onPressed: () async {
                                await _loginFct();
                              },
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
                            height: kBottomNavigationBarHeight + 10,
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: kBottomNavigationBarHeight,
                                    child: FittedBox(
                                      child: GoogleButton(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: kBottomNavigationBarHeight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(12.0),
                                        // backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12.0,
                                          ),
                                        ),
                                      ),
                                      child: const Text("Guest?"),
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pushNamed(RootScreen.routeName);
                                      },
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
                              const SubtitleTextWidget(label: "New here?"),
                              TextButton(
                                child: const SubtitleTextWidget(
                                  label: "Sign up",
                                  fontStyle: FontStyle.italic,
                                  textDecoration: TextDecoration.underline,
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RegisterScreen.routeName);
                                },
                              ),
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
