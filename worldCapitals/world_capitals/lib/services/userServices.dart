import 'package:cloud_firestore/cloud_firestore.dart';
import '../app/domain/model/score.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Score>> getScore() async {
  List<Score> misScores = [];
  QuerySnapshot queryScore = await db.collection('score').get();

  for (var doc in queryScore.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Score newScore =
        Score(scoreId: doc.id, name: data['name'], points: data['points']);
    misScores.add(newScore);
  }

  misScores.sort((a, b) => b.points.compareTo(a.points));
  return misScores;
}

Future<void> addScore(String newUid, dynamic newPoints) async {
  List<Score> misScores = [];
  QuerySnapshot queryScore = await db.collection('score').get();

  for (var doc in queryScore.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Score newScore =
        Score(scoreId: doc.id, name: data['name'], points: data['points']);
    misScores.add(newScore);
  }

  if (misScores.length < 9) {
    newScore(newUid, newPoints);
  } else {
    misScores.sort((a, b) => b.points.compareTo(a.points));

    for (Score sc in misScores) {
      if (newPoints > sc.points) {
        updateScore(newUid, newPoints, sc.scoreId);
        break;
      }
    }
  }
}

Future<void> newScore(String newName, dynamic newPoints) async {
  await db.collection('score').add({'name': newName, 'points': newPoints});
}

Future<void> updateScore(String name, dynamic points, String scoreId) async {
  await db.collection('score').doc(scoreId).set({'points': points, 'name': name});
}
