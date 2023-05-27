import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:world_capitals/app/ui/pages/game/widgets/questionTittle.dart';
import '../../../utils/spacing.dart';
import '../../global_controllers/session_controller.dart';
import '../../routes/routes.dart';
import 'widgets/progressBar.dart';
import '../../../../services/userServices.dart';
import '../../../domain/model/game.dart';
import '../../../domain/model/question.dart';
import '../result/result_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int totalQuestions = 5;
  int totalOptions = 4;
  int questionIndex = 0;
  int progressIndex = 0;
  Game partida = Game(name: 'Acierta las Capitales', questions: []);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/countries.json');
    final List<dynamic> data = await json.decode(response);

    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];

    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> moreOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        moreOptions.add(data[option]['capital_es']);
      }

      Question question = Question.fromJson(data[answer]);
      question.addOptions(moreOptions);
      partida.questions.add(question);

      if (partida.questions.length >= totalQuestions) break;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(String selected) {
    partida.questions[questionIndex].selected = selected;
    if (selected == partida.questions[questionIndex].answer) {
      partida.questions[questionIndex].correct = true;
      partida.right += 1;
    }

    progressIndex += 1;
    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {

      addScore('', partida.right);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    partida: partida,
                  )));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to leave the game?'),
              content: const Text('Game progress will be lost.'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                    router.pushNamedAndRemoveUntil(Routes.HOME);
                  },
                  child: const Text('Yes',style: TextStyle(color: Colors.black),),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No', style: TextStyle(color: Colors.black),),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF2779a7),
        appBar: AppBar(
          title: Text(partida.name),
          backgroundColor: const Color(0xff1d597a),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            progress(),
            answerBox(context),
            skipButton(context),
          ],
        ),
      ),
    );
  }

  Column progress() {
    return Column(
      children: [
        Text(
          'Score: ${partida.right}',
          style: const TextStyle(
            fontFamily: 'EncodeSans',
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        const Espaciado(num: 10),
        ProgressBar(
            progressIndex: progressIndex, totalQuestions: totalQuestions),
      ],
    );
  }

  ConstrainedBox answerBox(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 450),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: partida.questions.isNotEmpty
            ? buildCard(context)
            : const CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
      ),
    );
  }

  TextButton skipButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        _optionSelected('Skipped');
      },
      child: const Text(
        'Skip',
        style: TextStyle(
          fontFamily: 'EncodeSans',
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Card buildCard(BuildContext context) {
    return Card(
      color: const Color(0xff1d597a),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QuestionTittle(partida: partida, questionIndex: questionIndex),
          const Espaciado(num: 10),
          answerTags(context),
        ],
      ),
    );
  }

  Flexible answerTags(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: totalOptions,
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff1d597a), width: 3),
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffECD06F),
            ),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              //numeros
              leading: Text('\t${index + 1}',
                style: const TextStyle(
                  fontFamily: 'EncodeSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0,
                  color: Colors.black,
                ),),
              //respuestas
              title: Text(partida.questions[questionIndex].options[index],
                style: const TextStyle(
                  fontFamily: 'EncodeSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                _optionSelected(
                    partida.questions[questionIndex].options[index]);
              },
            ),
          );
        },
      ),
    );
  }
}


