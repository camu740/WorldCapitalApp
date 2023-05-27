import 'package:flutter/material.dart';
import '../../../../services/userServices.dart';


class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => ScorePageState();
}

class ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2779a7),
        appBar: AppBar(
          title: const Text('Best Scores'),
          backgroundColor: const Color(0xff1d597a),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: getScore(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff1d597a), width: 4),
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
                      leading: Text(
                        '${index + 1}º',
                        style: const TextStyle(
                          fontFamily: 'EncodeSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          '${snapshot.data?[index].points} points  ${snapshot.data?[index].name}',
                          style: const TextStyle(
                            fontFamily: 'EncodeSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
  }
}
