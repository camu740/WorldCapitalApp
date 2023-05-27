import 'package:flutter/material.dart';

class UserTextField extends StatefulWidget {
  const UserTextField({
    Key? key,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  _UserTextFieldState createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validator,
        initialValue: '',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              onChanged: (text) {
                if (widget.validator != null) {
                  // ignore: invalid_use_of_protected_member
                  state.setValue(text);
                  state.validate();
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(text);
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Color(0xff2779a7),
                ),
                hintText: "ejemplo@email.com",
                hintStyle: TextStyle(color: Color(0xff29467a)),
                labelText: "Correo Electrónico",
                labelStyle: TextStyle(color: Color(0xff2779a7)),
              ),
            ),
          );
        });
  }
}
