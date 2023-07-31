import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/search/widgets/search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: getReleased(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Row(
                      children: [
                        Container(
                          width: size.width * 0.4,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w200${snapshot.data?[index].backdropPath}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        kWidth,
                        Expanded(
                          child: Text(
                            snapshot.data![index].title!,
                            style: const TextStyle(
                                color: kWhite,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: kWhite,
                          radius: 25,
                          child: Icon(
                            Icons.play_circle_fill,
                            color: kBlackColor,
                            size: 50,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => kHeight20,
              itemCount: 10),
        ),
      ],
    );
  }
}
