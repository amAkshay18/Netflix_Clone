import 'package:flutter/material.dart';
import 'package:netflix/presentation/fastlaugh/widgets/video_list_items.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
            10,
            (index) => VideoListItems(
                  index: index,
                )),
      )),
    );
  }
}
