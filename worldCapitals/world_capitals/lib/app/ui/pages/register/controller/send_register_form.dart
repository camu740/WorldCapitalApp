import 'package:flutter/cupertino.dart';
import 'package:world_capitals/app/domain/inputs/sign_up.dart';
import 'package:world_capitals/app/utils/dialogs/progress_dialog.dart';
import '../../../../utils/dialogs/dialogs.dart';
import '../../../routes/routes.dart';
import '../register_page.dart' show registerProvider;
import 'package:flutter_meedu/ui.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();

    //cerramos el dialog
    router.pop();

    if (response.error != null) {
      String content = "";
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "Email already in use.";
          break;
        case SignUpError.weakPassword:
          content = "Weak Password.";
          break;
        case SignUpError.networkRequestFailed:
          content = "Network Request Failed.";
          break;
        case SignUpError.tooManyRequest:
          content = "Too Many Request, please wait some minutes.";
          break;
        case SignUpError.unknown:
        default:
          content = "Check the fields are valid.";
          break;
      }
      Dialogs.alert(context, title: "Invalid fields.", content: content);
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.LOGIN,
      );
    }
  } else {
    Dialogs.alert(context,
        title: "Failed to register.", content: "check the fields are valid.");
  }
}
