import 'package:flutter/material.dart';
import 'package:lily_house/screens/search_screen.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';

import '../services/assets_manager.dart';
class EmptyBagWidget extends StatelessWidget {
  final String imagePath , title , subtitle , buttonText;
  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: size.height * 0.35,
                width: double.infinity,

              ),
              const TitleTextWidget(
                label: "Oops!",
                fontSize: 40,
                color: Colors.red,
              ),
              const SizedBox(
                height: 20,
              ),
              SubtitleTextWidget(
                label: title ,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: SubtitleTextWidget(
                  label:subtitle,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
