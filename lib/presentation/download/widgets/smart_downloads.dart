import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import '../../../core/colors/colors.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text('Smart Downloads')
      ],
    );
  }
}
