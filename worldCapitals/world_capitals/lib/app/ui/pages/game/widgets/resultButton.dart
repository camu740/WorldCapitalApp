import 'package:flutter/material.dart';
import '../../../../domain/model/game.dart';
import '../../result/result_page.dart';

class ShowResultsButton extends StatelessWidget {
  const ShowResultsButton({
    Key? key,
    required this.partida,
  }) : super(key: key);

  final Game partida;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => ResultPage(
                partida: partida,
              ))),
        );
      },
      child: Text(
        'Ver Respuestas',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}