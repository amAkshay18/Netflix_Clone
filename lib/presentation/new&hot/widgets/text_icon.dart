import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  const TextIcon({
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24,
          color: kWhite,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: kWhite),
        ),
      ],
    );
  }
}
