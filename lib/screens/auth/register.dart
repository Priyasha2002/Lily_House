import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lily_house/services/my_app_methods.dart';
import 'package:lily_house/widgets/app_name_text.dart';
import 'package:lily_house/widgets/auth/google_button.dart';
import 'package:lily_house/widgets/auth/pick_image_widget.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final TextEditingController _confirmPasswordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _nameFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  XFile? _pickedImage;

  @override


  void initState(){
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    //Focus Nodes
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }
  @override

  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    // Focus Nodes
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _registerFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {}
  }
  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await MyAppMethods.imagePickerDialog(
        context: context,
        cameraFCT: () async{
          _pickedImage = await picker.pickImage(source: ImageSource.camera);
          setState(() {

          });
        },
        galleryFCT: () async{
      _pickedImage = await picker.pickImage(source: ImageSource.gallery);
      setState(() {

      });
    },
        removeFCT:() {
          setState(() {
            _pickedImage = null;
          });
        }
    );

  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  height: 30.0,
                ),
                const AppNameTextWidget(
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Align(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleTextWidget(label: "Welcome to Lily House where",fontWeight: FontWeight.bold),
                      SubtitleTextWidget(label: "Elegance meets convenience",
                      fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: size.width * 0.3,
                  width: size.width * 0.3,
                  child: PickImageWidget(
                    pickedImage:_pickedImage ,
                    function: () async {
                      await localImagePicker();
                    } ,
                  ),
                ),
                const SizedBox(
                  height:16 ,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: "Full name",
                            prefixIcon: Icon(
                              IconlyLight.message,
                            ),
                          ),
                          validator: (value){
                            return MyValidators.displayNamevalidator(value);
                          },
                          onFieldSubmitted: (value){
                            FocusScope.of(context)
                                .requestFocus(_emailFocusNode);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: const Icon(
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
                          height: 16.0,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          textInputAction: TextInputAction.next,
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
                            _registerFct();
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
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
                            _registerFct();
                          },
                        ),

                        const SizedBox(
                          height: 16.0,
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
                              _registerFct();
                            },
                            icon: const Icon(Icons.person),
                            label: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
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
