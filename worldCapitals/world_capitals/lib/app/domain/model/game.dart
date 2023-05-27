import 'question.dart';

class Game {
  String name;
  List<Question> questions;
  int right = 0;

  Game({required this.name, required this.questions});

  double get percent => (right / questions.length) * 100;
}