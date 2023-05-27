import 'package:flutter/material.dart';
import 'package:world_capitals/app/ui/pages/result/widgets/correctionsList.dart';
import 'package:world_capitals/app/ui/pages/result/widgets/resumeBar.dart';
import '../../../domain/model/game.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.partida}) : super(key: key);
  final Game partida;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D8CBE),
      appBar: AppBar(
          title: const Text(
            'Obtained result',
          ),
          backgroundColor: const Color(0xFF245270),
          elevation: 0,
          ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(
                    left: 3, right: 3, top: 5, bottom: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
                child: ResumeBar(partida: partida),
              ),
              Expanded(
                child: CorrectionsList(partida: partida),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
