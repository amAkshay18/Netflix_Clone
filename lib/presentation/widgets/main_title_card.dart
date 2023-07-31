import 'package:flutter/material.dart';
import 'package:netflix/domain/functions/functions.dart';
import '../../core/constants.dart';
import 'main_card_widget.dart';
import 'main_title_widget.dart';
import 'dart:core';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MainTitlewidget(title: title),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: getReleased(),
            builder: (context, snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) {
                    return snapshot.hasData
                        ? MainCardWidget(
                            imgString:
                                'https://image.tmdb.org/t/p/w200${snapshot.data?[index].posterPath}',
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class TrendingNow extends StatelessWidget {
  final String title;
  const TrendingNow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MainTitlewidget(title: title),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: getTrendingNow(),
            builder: (context, snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) {
                    return snapshot.hasData
                        ? MainCardWidget(
                            imgString:
                                'https://image.tmdb.org/t/p/w200${snapshot.data?[index].posterPath}',
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class TenseDrama extends StatelessWidget {
  final String title;
  const TenseDrama({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MainTitlewidget(title: title),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: getTenseDrama(),
            builder: (context, snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) {
                    return snapshot.hasData
                        ? MainCardWidget(
                            imgString:
                                'https://image.tmdb.org/t/p/w200${snapshot.data?[index].posterPath}',
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class SouthIndianCinema extends StatelessWidget {
  final String title;
  const SouthIndianCinema({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MainTitlewidget(title: title),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: getSouthIndianCinema(),
            builder: (context, snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) {
                    return snapshot.hasData
                        ? MainCardWidget(
                            imgString:
                                'https://image.tmdb.org/t/p/w200${snapshot.data?[index].posterPath}',
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
