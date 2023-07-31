import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/button_widget.dart';
import 'package:netflix/presentation/home/widgets/play_button_widget.dart';

class BackGroundCardWidget extends StatelessWidget {
  const BackGroundCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/lastofuscover.jpg'),
                  fit: BoxFit.cover)),
        ),
        const Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainscreenButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  textsize: 17,
                  iconsize: 30,
                ),
                PlayButton(),
                MainscreenButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                  textsize: 17,
                  iconsize: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
