import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:world_capitals/app/ui/pages/reset_password/controller/reset_password_controller.dart';
import 'package:world_capitals/app/utils/custom_input_field.dart';
import 'package:world_capitals/app/utils/dialogs/progress_dialog.dart';
import 'package:world_capitals/app/utils/validator.dart';

import '../../../domain/inputs/reset.dart';
import '../../../utils/dialogs/dialogs.dart';

final resetPasswordProvider = SimpleProvider((_) => ResetPasswordController());

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<ResetPasswordController>(
      provider: resetPasswordProvider,
      builder: (_, controller) => Scaffold(
        backgroundColor: const Color(0xffECD06F),
        appBar: AppBar(
          title: const Text('Reset Password'),
          backgroundColor: const Color(0xff8d7d42),
          elevation: 0,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInputField(
                      label: "Email",
                      onChanged: controller.onEmailChanged,
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10.0,
                      color: const Color(0xff2779a7),
                      onPressed: () => _submit(context),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Send mail',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) async {
    final controller = resetPasswordProvider.read;

    if (isValidEmail(controller.email)) {
      ProgressDialog.show(context);
      final response = await controller.submit();
      Navigator.pop(context);
      if (response == ResetPasswordResponse.ok) {
        Dialogs.alert(context,
            title: "Good job!", content: "Email sent, check your e-mail. ");
      } else {
        String content = "";

        switch (response) {
          case ResetPasswordResponse.networkRequestFailed:
            content = "Network Request Failed.";
            break;
          case ResetPasswordResponse.invalidEmail:
            content = "Invalid Email.";
            break;
          case ResetPasswordResponse.userDisabled:
            content = "User Disabled.";
            break;
          case ResetPasswordResponse.userNotFound:
            content = "User Not Found.";
            break;
          case ResetPasswordResponse.tooManyRequest:
            content = "Too Many Request, please wait some minutes.";
            break;
          case ResetPasswordResponse.unknown:
          default:
            content = "Check the fields are valid.";
            break;
        }

        Dialogs.alert(context, title: "Something failed", content: content);
      }
    } else {
      Dialogs.alert(context, content: "Invalid Email");
    }
  }
}
