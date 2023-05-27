class Question {
  late String country;
  String question = "Capital of ";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  //del json obtenemos el pais en country y la capital en answer
  Question.fromJson(Map<String, dynamic> json){
    country = json['name_es'];
    answer = json['capital_es'];
  }

  //añadir opciones diferentes de la correcta
  void addOptions(List<String> moreOptions) {
    question += country;
    options.add(answer);
    options.addAll(moreOptions);
    options.shuffle();
  }
}