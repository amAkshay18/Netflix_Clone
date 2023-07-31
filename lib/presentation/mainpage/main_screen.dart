import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/fastlaugh/fast_laugh.dart';
import 'package:netflix/presentation/mainpage/widgets/bottomNavigationBar.dart';
import '../download/download_screen.dart';
import '../home/home_screen.dart';
import '../new&hot/new_and_hot.dart';
import '../search/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final pages = [
    const HomeScreen(),
    const NewAndHot(),
    const FastLaugh(),
    const SearchScreen(),
    const DownloadScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexnotifier,
          builder: (context, index, child) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarwidget(),
    );
  }
}
