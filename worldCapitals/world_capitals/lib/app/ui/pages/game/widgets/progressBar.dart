import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.progressIndex,
    required this.totalQuestions,
  }) : super(key: key);

  final int progressIndex;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: LinearProgressIndicator(
          color:  const Color(0xffECD06F),
          value: progressIndex / totalQuestions,
          minHeight: 20,
        ),
      ),
    );
  }
}