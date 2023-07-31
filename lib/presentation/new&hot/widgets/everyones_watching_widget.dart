import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/new&hot/widgets/text_icon.dart';

class EveryOnesWatching extends StatelessWidget {
  const EveryOnesWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getReleased(),
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return snapshot.hasData
                  ? Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: double.infinity,
                        height: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data?[index].title}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                            kHeight,
                            Text(
                              '${snapshot.data?[index].overview}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            kHeight20,
                            Stack(
                              children: [
                                Image.network(
                                  'https://image.tmdb.org/t/p/w200${snapshot.data?[index].backdropPath}',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Colors.black.withOpacity(0.5),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.volume_off,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            kHeight,
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'LOST\nIN\nSPACE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15, letterSpacing: 10),
                                  ),
                                  Spacer(),
                                  TextIcon(icon: Icons.share, title: 'Share'),
                                  kWidth,
                                  TextIcon(icon: Icons.add, title: 'My List'),
                                  kWidth,
                                  TextIcon(
                                      icon: Icons.play_arrow, title: 'Play'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
            });
      },
    );
  }
}
