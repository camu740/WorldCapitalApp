import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_capitals/app/ui/pages/study/widgets/numberCountryTag.dart';
import '../../../domain/model/game.dart';
import '../../../domain/model/question.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  Game game = Game(name: 'Quiz de Capitales', questions: []);

  Future<void> readJsonData() async {
    final String response =
        await rootBundle.loadString('assets/json/countries.json');
    final List<dynamic> data = await json.decode(response);

    for (var item in data) {
      Question question = Question.fromJson(item);
      question.question += question.country;
      game.questions.add(question);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2779a7),
        appBar: AppBar(
          title: const Text('Study Capitals'),
          backgroundColor: const Color(0xff1d597a),
          elevation: 0,
        ),
        body: game.questions.isNotEmpty
            ? Column(
                children: [
                  NumberCountriesTag(game: game),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: game.questions.length,
                          itemBuilder: (_, index) {
                            return buildCard(context, index);
                          }),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ));
  }

  Card buildCard(BuildContext context, int index) {
    return Card(
      color: const Color(0xffECD06F),
      child: ListTile(
        leading: Text("${index + 1}"),
        title: Text(game.questions[index].country),
        trailing: Text(game.questions[index].answer),
      ),
    );
  }
}
