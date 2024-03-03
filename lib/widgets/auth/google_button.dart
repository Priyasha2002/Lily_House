import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lily_house/services/my_app_methods.dart';
import '../../root_screen.dart';
class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});
  Future<void> _googleSign({required BuildContext context}) async {

      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          try {
            final authResults = await FirebaseAuth.instance
                .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            ));
            if (authResults.additionalUserInfo!.isNewUser) {
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(authResults.user!.uid)
                  .set({
                'userId': authResults.user!.uid,
                'userName': authResults.user!.displayName,
                'userImage': authResults.user!.photoURL,
                'userEmail': authResults.user!.email,
                'createdAt': Timestamp.now(),
                'userWish': [],
                'userCart': [],
              });
              Fluttertoast.showToast(
                msg: "Logged in",
                textColor: Colors.white,
              );

            }
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              Navigator.pushReplacementNamed(context, RootScreen.routeName);
            });
          } on FirebaseException catch (error) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await MyAppMethods.showErrorORWarningDialog(
                  context: context,
                  subtitle: "An error has been occured ${error.message}",
                  fct: () {});
            });
          } catch (error) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await MyAppMethods.showErrorORWarningDialog(
                  context: context,
                  subtitle: "An error has been occured ${error}",
                  fct: () {});
            });
          }
        }
      }
  }




          @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        //backgroundColor: Colors.purple.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
        onPressed: (){
          _googleSign(context: context);
          },
        icon: const Icon(Ionicons.logo_google,),
      label: const Text("Sign in with google",
        style: TextStyle(
          fontWeight: FontWeight.bold,

        ),
      )
    );
  }
}
