import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhite),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: kBlackColor,
        size: 30,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(
              fontSize: 20, color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
