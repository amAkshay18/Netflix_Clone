import 'dart:developer';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/domain/models/common_model/result.dart';
import '../../widgets/main_title_widget.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Result> results = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitlewidget(title: 'Top 10 TV Shows In India Today'),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: getTop10TvShowsInIndiaToday(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                results = snapshot.data!;
              }
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : snapshot.data!.isEmpty
                      ? const Center(
                          child: Text('illaaa pokko'),
                        )
                      : ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(results.length, (index) {
                            log('https://image.tmdb.org/t/p/w200${snapshot.data![index].posterPath}');
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        height: 150,
                                        width: 40,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 250,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    'https://image.tmdb.org/t/p/w200${snapshot.data![index].posterPath}'))),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: 10,
                                    bottom: -26,
                                    child: BorderedText(
                                      strokeWidth: 6.0,
                                      strokeColor: Colors.grey,
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 120,
                                            decoration: TextDecoration.none,
                                            decorationColor: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        );
            },
          ),
        ),
      ],
    );
  }
}
