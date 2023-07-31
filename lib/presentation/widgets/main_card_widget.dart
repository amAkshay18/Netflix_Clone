import 'package:flutter/material.dart';

class MainCardWidget extends StatelessWidget {
  final String imgString;
  const MainCardWidget({
    required this.imgString,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 180,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(imgString), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
