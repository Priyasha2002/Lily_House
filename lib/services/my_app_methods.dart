import 'package:flutter/material.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'assets_manager.dart';

class MyAppMethods{
  static Future<void> showErrorOrWarningDialog(
  {
    required BuildContext context,
    required String subtitle,
    required Function fct,
    bool isError = true,
  }) async{
    await showDialog
      (context: context,
        builder: (context) {
        return AlertDialog(
          content: Column(
            children: [
              Image.asset(
                  AssetsManager.warning,
                height: 60,
                width: 60,
              ),

              const SizedBox(
                height: 16.0,
              ),
              SubtitleTextWidget(
                  label: subtitle,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Visibility(
                    visible: !isError,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const SubtitleTextWidget(
                            label: "Cancel",
                          color: Colors.green,
                        ),
                      ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: (){
                    fct();
                  },
                  child: const SubtitleTextWidget(
                      label: "Ok",
                      color: Colors.red,
                  ),
              ),
            ],
          ),

        );
        },
    );
  }

  static Future<void> imagePickerDialog ({
    required BuildContext context,
    required Function cameraFCT,
    required Function galleryFCT,
    required Function removeFCT,
}) async {
    await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Center(
          child:  TitleTextWidget(
              label: "Choose an option"
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextButton.icon(
                  onPressed: (){
                    cameraFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              TextButton.icon(
                onPressed: (){
                  galleryFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text("Gallery"),
              ),
              TextButton.icon(
                onPressed: (){
                  removeFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.remove),
                label: const Text("Remove"),
              ),


            ],
          ),
        ),
      );
    },
    );
}
}