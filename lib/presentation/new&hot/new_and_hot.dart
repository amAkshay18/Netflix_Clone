import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/new&hot/widgets/everyones_watching_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/text_icon.dart';
import '../../core/constants.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
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
                  child: Image.asset('assets/images/Netflix-avatar.png'),
                ),
              ),
              kWidth
            ],
            bottom: TabBar(
              labelColor: kBlackColor,
              isScrollable: true,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: kWhite,
              indicator: BoxDecoration(color: kWhite, borderRadius: kRadius30),
              tabs: const [
                Tab(text: "🍿coming soon"),
                Tab(
                  text: "👀Everyone's Whatching",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            comingSoon(context),
            const EveryOnesWatching(),
          ],
        ),
      ),
    );
  }
}

Widget comingSoon(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return ListView.builder(
    itemCount: 10,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return FutureBuilder(
        future: getReleased(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 50,
                        height: 450,
                        child: Column(
                          children: [
                            Text('11',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 4)),
                            Text("feb",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width - 60,
                        height: 450,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${snapshot.data?[index].title}',
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: .6,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Spacer(),
                                      const TextIcon(
                                        icon: CupertinoIcons.bell_solid,
                                        title: 'Reminder',
                                      ),
                                      kWidth,
                                      const TextIcon(
                                        icon: CupertinoIcons.info,
                                        title: 'Info',
                                      ),
                                      kWidth,
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(
                                'Coming On ${snapshot.data?[index].releaseDate}'),
                            kHeight20,
                            const Row(
                              children: [
                                Text(
                                  'N',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' Films',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              '${snapshot.data?[index].title}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            kHeight,
                            Text(
                              '${snapshot.data?[index].overview}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: const TextStyle(
                                fontSize: 11.7,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
        },
      );
    },
  );
}
