import 'package:flutter/material.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:shimmer/shimmer.dart';

class AppNameTextWidget extends StatelessWidget {
  final double fontSize;
  const AppNameTextWidget({super.key, this.fontSize=30});

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
        baseColor: Colors.purple,
        highlightColor: Colors.red,
        child: TitleTextWidget(
          label: "Lily House",
          fontSize: fontSize,
        ),
    );
  }
}


