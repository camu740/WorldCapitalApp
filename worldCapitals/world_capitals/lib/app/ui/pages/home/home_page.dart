import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:world_capitals/app/ui/pages/home/widgets/button_principal.dart';
import '../../routes/routes.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff32353d),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff32353d),
      ),
      body: Center(
        child: Column(
          children: [
            worldGif(),
            Card(
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).primaryColorDark,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  tittle(),
                  const ButtonHome(
                    texto: 'New Game',
                    ruta: Routes.GAME,
                    isLogOut: false,
                  ),
                  const ButtonHome(
                    texto: 'Study',
                    ruta: Routes.STUDY,
                    isLogOut: false,
                  ),
                  const ButtonHome(
                    texto: 'Score',
                    ruta: Routes.SCORE,
                    isLogOut: false,
                  ),
                  const ButtonHome(
                    texto: 'Sign Out',
                    ruta: Routes.LOGIN,
                    isLogOut: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container tittle() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10, bottom: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff49c5b6), Color(0xff2779a7)]),
          borderRadius: BorderRadius.circular(5)),
      child: const Center(
        child: Text(
          'WORLD CAPITALS',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Container worldIcon() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Icon(
        FontAwesomeIcons.earthEurope,
        size: 100,
        color: Colors.blue.shade100,
      ),
    );
  }

  Container worldGif() {
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
            //image: NetworkImage("https://cdnb.artstation.com/p/assets/images/images/009/572/629/original/yuriy-kaplitskiy-webp-net-gifmaker-3.gif?1519741904"),
            image: AssetImage("assets/images/earth2.gif")),
        shape: BoxShape.circle,
      ),
      width: 200,
      height: 200,
    );
  }
}
