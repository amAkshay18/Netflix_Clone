import 'package:flutter/material.dart';
import 'package:netflix/presentation/download/widgets/bottom_section.dart';
import 'package:netflix/presentation/download/widgets/middle_section.dart';
import 'package:netflix/presentation/download/widgets/smart_downloads.dart';
import '../widgets/appbar_widget.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  final _widgetlist = const [
    SmartDownloads(),
    SectionMiddle(),
    SectionBottom(),
  ];

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return _widgetlist[index];
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 25,
            );
          },
          itemCount: _widgetlist.length),
    );
  }
}
