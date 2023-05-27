import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../routes/routes.dart';
import '../controller/send_register_form.dart';

class ButtonSign extends StatelessWidget {
  const ButtonSign({
    Key? key,
    required this.texto, required this.isRegister}) : super(key: key);

  final String texto;
  final bool isRegister;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      elevation: 10.0,
      color: const Color(0xff2779a7),
      onPressed: () => isRegister ? sendRegisterForm(context) :  router.pushNamedAndRemoveUntil(Routes.LOGIN,),
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}