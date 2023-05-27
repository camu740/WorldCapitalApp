import 'package:flutter_meedu/ui.dart';
import 'package:world_capitals/app/ui/pages/register/controller/register_state.dart';
import 'package:world_capitals/app/ui/pages/register/widgets/button_sign.dart';
import 'package:flutter/material.dart';
import 'package:world_capitals/app/utils/validator.dart';
import '../../../utils/custom_input_field.dart';
import '../../../utils/spacing.dart';
import 'package:flutter_meedu/meedu.dart';
import '../../global_controllers/session_controller.dart';
import 'controller/register_controller.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: const Color(0xffECD06F),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child:
                Form(
                  key: controller.formKey,
                  child: Center(
                    child: ListView(
                      padding: const EdgeInsets.all(15),
                      children: [
                         const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontFamily: 'EncodeSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 60.0,
                                color: Color(0xff2779a7),
                              ),
                            ),
                          ),
                        const Espaciado(
                          num: 45.0,
                        ),
                        //campo texto del login
                        CustomInputField(
                          onChanged: controller.onNameChanged,
                          label: "Username",
                          inputType: TextInputType.name,
                          validator: (text) {
                            return isValidName(text!)
                                ? null
                                : "invalid username (only alphanumeric characters)";
                          },
                        ),
                        const Espaciado(
                          num: 25.0,
                        ),
                        CustomInputField(
                          onChanged: controller.onEmailChanged,
                          label: "E-mail",
                          inputType: TextInputType.emailAddress,
                          validator: (text) {
                            return isValidEmail(text!) ? null : "Invalid email";
                          },
                        ),
                        const Espaciado(
                          num: 25.0,
                        ),
                        CustomInputField(
                          onChanged: controller.onPasswordChanged,
                          label: "Password",
                          inputType: TextInputType.visiblePassword,
                          isPassword: true,
                          validator: (text) {
                            if (text!.trim().length >= 6) {
                              return null;
                            }
                            return "invalid password (6 characters at least)";
                          },
                        ),

                        const Espaciado(
                          num: 25.0,
                        ),
                        Consumer(
                          builder: (_, ref, __) {
                            ref.watch(
                                registerProvider.select((_) => _.password));
                            return CustomInputField(
                              onChanged: controller.onVPasswordChanged,
                              label: "Confirm Password",
                              inputType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: (text) {
                                if (controller.state.password != text) {
                                  return "password don´t match.";
                                }
                                if (text!.trim().length >= 6) {
                                  return null;
                                }
                                return "Invalid password (6 characters at least)";
                              },
                            );
                          },
                        ),
                        const Espaciado(
                          num: 50.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //boton del login
                              Column(
                                children: const [
                                  ButtonSign(
                                      texto: 'Go Login', isRegister: false,),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: const [
                                  ButtonSign(
                                      texto: 'Register', isRegister: true,),
                                ],
                              ),
                            ]),
                      ],
                    ),
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
