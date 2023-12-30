import 'package:flutter/material.dart';
import 'package:lily_house/widgets/subtitles_text.dart';

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
}