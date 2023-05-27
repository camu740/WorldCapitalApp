import 'package:flutter/material.dart';

import '../../../../domain/model/game.dart';

class QuestionTittle extends StatelessWidget {
  const QuestionTittle({
    Key? key,
    required this.partida,
    required this.questionIndex,
  }) : super(key: key);

  final Game partida;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle, ),
      margin: const EdgeInsets.all(15),
      child: Text(
        partida.questions[questionIndex].question,
        style: const TextStyle(
          fontFamily: 'EncodeSans',
          fontWeight: FontWeight.w500,
          fontSize: 30.0,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,

      ),
    );
  }
}
