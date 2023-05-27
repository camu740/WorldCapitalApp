import 'package:flutter/material.dart';
import '../../../../domain/model/game.dart';

class CorrectionsList extends StatelessWidget {
  const CorrectionsList({
    Key? key,
    required this.partida,
  }) : super(key: key);

  final Game partida;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: partida.questions.length,
        itemBuilder: (_, index) {
          return Card(
            color: partida.questions[index].correct
                ? Colors.green.shade200
                : Colors.red.shade200,
            child: ListTile(
              leading: partida.questions[index].correct
                  ? Icon(Icons.check, color: Colors.green.shade900)
                  : Icon(Icons.close, color: Colors.red.shade900),
              title: Text(partida.questions[index].country),
              subtitle: Text('Select: ${partida.questions[index].selected}'),
              trailing: Text(partida.questions[index].answer),
            ),
          );
        });
  }
}
