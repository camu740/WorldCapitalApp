import 'package:flutter/material.dart';
import '../../../../domain/model/game.dart';

class ResumeBar extends StatelessWidget {
  const ResumeBar({
    Key? key,
    required this.partida,
  }) : super(key: key);

  final Game partida;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Preguntas: ${partida.questions.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Aciertos (%): ${partida.percent}%',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Correctas: ${partida.right}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Falladas: ${partida.questions.length - partida.right}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
