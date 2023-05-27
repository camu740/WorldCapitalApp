import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:world_capitals/app/ui/global_controllers/session_controller.dart';
import '../../../../../services/googleSignIn.dart';
import '../../../../domain/repository/authentication_repository.dart';

class ButtonHome extends StatelessWidget {

  const ButtonHome({
    Key? key,
    required this.texto,
    required this.ruta, required this.isLogOut
  }) : super(key: key);

  final String texto;
  final String ruta;
  final bool isLogOut;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        if(isLogOut) {
          await sessionProvider.read.signOut();
          AuthServiceGoogle logOut = AuthServiceGoogle();
          logOut.logoutUsingGoogle(context);
          router.pushNamedAndRemoveUntil(ruta);
        }else{
          router.pushNamed(ruta);
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffECD06F),
        elevation: 4,
        side: const BorderSide(width: 1),
      ),
      child: Text(texto),
    );
  }
}