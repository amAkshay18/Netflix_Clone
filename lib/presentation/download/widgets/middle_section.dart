import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';
import '../../../core/colors/colors.dart';
import 'download_screen_image.dart';

class SectionMiddle extends StatelessWidget {
  const SectionMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          style: TextStyle(
              color: kWhite, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          "We will download a personolised selection of\n movies and shows for you ,so there's \n always something to watch on your \ndevice",
          style: TextStyle(color: kGreyColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        kHeight,
        FutureBuilder(
          future: getReleased(),
          builder: (context, snapshot) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: kGreyColor.withOpacity(0.5),
                      radius: size.width * 0.35,
                    ),
                  ),
                  DownloadScreenImage(
                    size: Size(size.width * 0.4, size.width * 0.5),
                    image:
                        'https://image.tmdb.org/t/p/w200${snapshot.data?[0].posterPath}',
                    rotation: -15,
                    margin: const EdgeInsets.only(right: 150, bottom: 0),
                  ),
                  DownloadScreenImage(
                    size: Size(size.width * 0.4, size.width * 0.5),
                    image:
                        'https://image.tmdb.org/t/p/w200${snapshot.data?[1].posterPath}',
                    rotation: 15,
                    margin: const EdgeInsets.only(left: 150, bottom: 0),
                  ),
                  DownloadScreenImage(
                    size: Size(size.width * 0.4, size.width * 0.55),
                    image:
                        'https://image.tmdb.org/t/p/w200${snapshot.data?[2].posterPath}',
                    rotation: 0,
                    margin: const EdgeInsets.only(top: 20),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
