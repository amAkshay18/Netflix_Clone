import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';

class SectionBottom extends StatelessWidget {
  const SectionBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: kBlueButton,
              onPressed: () {},
              child: const Text(
                'Set up',
                style: TextStyle(
                    color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: MaterialButton(
            height: 45,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: kWhite,
            onPressed: () {
              getTop10TvShowsInIndiaToday();
            },
            child: const Text(
              'See What You can Download',
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
