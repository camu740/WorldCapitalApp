import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:world_capitals/app/ui/pages/login/login_page.dart';
import 'package:world_capitals/app/utils/dialogs/progress_dialog.dart';

import '../../../../domain/inputs/sign_in.dart';
import '../../../../utils/dialogs/dialogs.dart';
import '../../../routes/routes.dart';

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      String content = "";
      switch (response.error) {
        case SignInError.networkRequestFailed:
          content = "Network Request Failed.";
          break;
        case SignInError.userDisabled:
          content = "User Disabled.";
          break;
        case SignInError.userNotFound:
          content = "User Not Found.";
          break;
        case SignInError.tooManyRequest:
          content = "Too Many Request, please wait some minutes.";
          break;
        case SignInError.invalidEmail:
        case SignInError.wrongPassword:
        case SignInError.unknown:
        default:
        content = "Check the fields are valid.";
          break;
      }
      Dialogs.alert(context, title: "Invalid fields.", content: content);
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
