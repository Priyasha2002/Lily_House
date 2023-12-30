import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/app_name_text.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController _emailController;
  late final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _forgetPassFCT() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppNameTextWidget(
          fontSize: 22,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            children: [
              //Section 1 Header
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                AssetsManager.forgotPassword,
                width: size.width * 0.6,
                height: size.width * 0.6,
              ),
              const SizedBox(
                height: 10,
              ),
              const TitleTextWidget(
                label: "Forgot Password",
                fontSize: 22,
              ),
              const SubtitleTextWidget(
                label:
                    "Please enter the email address you\'d like your passwordreset information sent to",
                fontSize: 14,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key:  _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "youremail@gmail.com",
                        prefixIcon: Container(
                            padding:const  EdgeInsets.all(12.0),
                            child:const  Icon(
                              IconlyLight.message,
                            ),
                          ),
                        filled: true,
                        ),
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      },
                      onFieldSubmitted: (_) {

                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  icon: const Icon(IconlyBold.send),
                  label: const Text(
                    "Request Link",
                    style:  TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    _forgetPassFCT();
                  },
                ),
              )
            ],
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
