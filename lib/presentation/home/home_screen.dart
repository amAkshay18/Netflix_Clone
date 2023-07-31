import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/backgroundcard_widget.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollnotifier,
        builder: (context, value, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollnotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollnotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackGroundCardWidget(),
                    MainTitleCard(title: 'Released in the Past Year'),
                    kHeight,
                    TrendingNow(title: 'Trending Now'),
                    kHeight,
                    NumberCard(),
                    kHeight,
                    TenseDrama(title: 'Tense Drama'),
                    kHeight,
                    SouthIndianCinema(title: 'South Indian Cinema'),
                  ],
                ),
                scrollnotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: 80,
                        width: double.infinity,
                        color: kBlackColor.withOpacity(0.5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Netflix_2015_N_logo.svg.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  kWidth,
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                          'assets/images/Netflix-avatar.png'),
                                    ),
                                  ),
                                  kWidth
                                ],
                              ),
                            ),
                            kHeight,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Tv Shows',
                                  style: homeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: homeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: homeTitleText,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
