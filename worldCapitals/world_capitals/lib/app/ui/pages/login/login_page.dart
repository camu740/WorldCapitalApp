import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:world_capitals/app/ui/pages/login/controller/login_controller.dart';
import 'package:world_capitals/app/ui/pages/login/controller/send_login_form.dart';
import 'package:world_capitals/app/ui/pages/register/register_page.dart';
import '../../../../services/googleSignIn.dart';
import 'package:flutter/material.dart';
import '../../../utils/dialogs/dialogs.dart';
import '../../../utils/password_textfield.dart';
import '../../../utils/spacing.dart';
import '../../../utils/userTextField.dart';
import '../../../utils/validator.dart';
import '../../global_controllers/session_controller.dart';
import '../../routes/routes.dart';

final loginProvider =
    SimpleProvider((_) => LoginController(sessionProvider.read));

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          backgroundColor: const Color(0xffECD06F),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Form(
                key: controller.formKey,
                child: Center(
                  child: ListView(
                    children: [
                      const Text(
                        'World\nCapitals',
                        style: TextStyle(
                          fontFamily: 'EncodeSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 60.0,
                          color: Color(0xff2779a7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Espaciado(
                        num: 45.0,
                      ),
                      //campo texto del login
                      UserTextField(
                          onChanged: controller.onEmailChanged,
                          validator: (text) {
                            if (isValidEmail(text!)) {
                              return null;
                            }
                            return "Invalid E-mail.";
                          }),
                      const Espaciado(
                        num: 25.0,
                      ),
                      //campo password del login
                      PasswordTextField(onChanged: controller.onPasswordChanged,
                          validator: (text) {
                            if (text!.trim().length>=6) {
                              return null;
                            }
                            return "Invalid password (6 characters at least)";
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () =>
                                router.pushNamed(Routes.RESET_PASSWORD),
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2779a7),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Espaciado(
                        num: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //boton del login
                          Column(
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 10.0,
                                color: const Color(0xff2779a7),
                                onPressed: () => sendLoginForm(context),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          //boton del login
                          Column(
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 10.0,
                                color: const Color(0xff2779a7),
                                onPressed: () async {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()),
                                      (route) => false);
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13.0, vertical: 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text(
                                          'Register',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Continue with",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 10.0,
                            color: Colors.white,
                            onPressed: () async {
                              User? user = await AuthServiceGoogle()
                                  .loginUsingGoogle(context: context);
                              if (user != null) {
                                router.pushNamedAndRemoveUntil(
                                  Routes.HOME,
                                );
                              } else {
                                Dialogs.alert(context,
                                    title: "Login failed.",
                                    content:
                                        "Check the google account is valid.");
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/googleIcon.png"),
                                      width: 25,
                                      height: 25,
                                    ),
                                    Text(
                                      '\t\tGoogle',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
