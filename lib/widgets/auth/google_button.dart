import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

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
