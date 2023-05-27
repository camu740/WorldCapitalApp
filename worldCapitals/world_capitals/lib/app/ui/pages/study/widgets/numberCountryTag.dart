import 'package:flutter/material.dart';

import '../../../../domain/model/game.dart';

class NumberCountriesTag extends StatelessWidget {
  const NumberCountriesTag({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
          left: 15, right: 15, top: 15, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        border:
        Border.all(color: const Color(0xff13384d), width: 3),
      ),
      child: Center(
        child: Text(
          "Countries: ${game.questions.length}",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}