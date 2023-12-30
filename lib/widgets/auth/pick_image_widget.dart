import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? pickedImage;
  final Function function;
  const PickImageWidget({
    super.key,
    this.pickedImage,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: pickedImage == null ?Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                )
              ),
            )
                : Image.file(
              File(
               pickedImage!.path,
            ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
          borderRadius:  BorderRadius.circular(16.0),
            color: Colors.purple.shade400,
            child: InkWell(
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(16.0),
              onTap: (){
                function();
              },
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Icon(Icons.camera_alt,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            )
        ),
        ),
      ],
    );
  }
}
